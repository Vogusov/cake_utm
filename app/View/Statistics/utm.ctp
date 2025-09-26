<?php
$this->assign('title_for_layout', 'UTM Statistics');

function hnull($v) { return is_null($v) ? 'NULL' : h($v); }
?>

<h1>UTM Statistics</h1>

<?php if (empty($tree)): ?>
	<p>Данные отсутствуют.</p>
<?php else: ?>
	<ul>
		<?php foreach ($tree as $source => $mediums): ?>
			<li>
				<strong><?php echo h($source); ?></strong>
				<ul>
					<?php foreach ($mediums as $medium => $campaigns): ?>
						<li>
							<?php echo h($medium); ?>
							<ul>
								<?php foreach ($campaigns as $campaign => $contents): ?>
									<li>
										<?php echo h($campaign); ?>
										<ul>
											<?php foreach ($contents as $content => $terms): ?>
												<li>
													<?php echo hnull($content); ?>
													<ul>
														<?php foreach ($terms as $term): ?>
															<li><?php echo hnull($term); ?></li>
														<?php endforeach; ?>
													</ul>
												</li>
											<?php endforeach; ?>
										</ul>
									</li>
								<?php endforeach; ?>
							</ul>
						</li>
					<?php endforeach; ?>
				</ul>
			</li>
		<?php endforeach; ?>
	</ul>

	<div class="pagination">
		<?php
		echo $this->Paginator->prev('« Prev', null, null, array('class' => 'disabled'));
		echo ' | ';
		echo $this->Paginator->numbers();
		echo ' | ';
		echo $this->Paginator->next('Next »', null, null, array('class' => 'disabled'));
		?>
	</div>
<?php endif; ?>
