<?php

class UtmData extends AppModel
{
	public $useTable = 'utm_data';

	public $validate = array(
		'source' => array('rule' => 'notBlank', 'required' => true),
		'medium' => array('rule' => 'notBlank', 'required' => true),
		'campaign' => array('rule' => 'notBlank', 'required' => true),
		'content' => array('allowEmpty' => true),
		'term' => array('allowEmpty' => true),
	);
}
