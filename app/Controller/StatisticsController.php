<?php
App::uses('AppController', 'Controller');

class StatisticsController extends AppController
{
	public $uses = ['UtmData'];
	public $components = ['Paginator'];


	public function utm()
	{
		$conditions = array(); // добавьте ваши фильтры при необходимости

		// 1) Настройка пагинации по уникальным source
		$this->Paginator->settings = array(
			'UtmData' => array(
				'fields' => array('UtmData.source'),
				'group' => array('UtmData.source'),
				'limit' => 20,
				'order' => array('UtmData.source' => 'ASC'),
				'conditions' => $conditions,
				'recursive' => -1,
			)
		);

		// 2) Вычисляем последнюю страницу и нормализуем page
		$totalDistinct = $this->countDistinctSources($conditions);
		$limit = (int)$this->Paginator->settings['UtmData']['limit'];
		$lastPage = max(1, (int)ceil($totalDistinct / $limit));

		// Текущая страница из named params
		$page = isset($this->request->params['named']['page']) ? (int)$this->request->params['named']['page'] : 1;
		if ($page < 1) $page = 1;
		if ($page > $lastPage) {
			// Вариант A: тихо нормализовать без редиректа
			$this->request->params['named']['page'] = $lastPage;
		}

		// 3) Пагинация
		$distinctSources = $this->Paginator->paginate('UtmData');

		// 4) Построение дерева по источникам страницы
		$sources = Hash::extract($distinctSources, '{n}.UtmData.source');
		$tree = array();
		if (!empty($sources)) {
			$rows = $this->UtmData->find('all', array(
				'conditions' => array('UtmData.source' => $sources) + $conditions,
				'fields' => array('UtmData.source', 'UtmData.medium', 'UtmData.campaign', 'UtmData.content', 'UtmData.term'),
				'order' => array('UtmData.source', 'UtmData.medium', 'UtmData.campaign', 'UtmData.content', 'UtmData.term'),
				'recursive' => -1,
			));

			foreach ($rows as $r) {
				$s = $r['UtmData']['source'];
				$m = $r['UtmData']['medium'];
				$c = $r['UtmData']['campaign'];
				$co = $r['UtmData']['content'];
				$t = $r['UtmData']['term'];
				if (!isset($tree[$s])) $tree[$s] = array();
				if (!isset($tree[$s][$m])) $tree[$s][$m] = array();
				if (!isset($tree[$s][$m][$c])) $tree[$s][$m][$c] = array();
				if (!isset($tree[$s][$m][$c][$co])) $tree[$s][$m][$c][$co] = array();
				$tree[$s][$m][$c][$co][] = $t;
			}
		}

		$this->set(compact('tree'));
	}

	protected function countDistinctSources($conditions = array())
	{
		$this->UtmData->virtualFields['distinct_cnt'] = 'COUNT(DISTINCT UtmData.source)';
		$row = $this->UtmData->find('first', array(
			'fields' => array('distinct_cnt'),
			'conditions' => $conditions,
			'recursive' => -1,
		));
		unset($this->UtmData->virtualFields['distinct_cnt']);
		var_dump($row);
		return (int)$row['UtmData']['distinct_cnt'];
	}
}
