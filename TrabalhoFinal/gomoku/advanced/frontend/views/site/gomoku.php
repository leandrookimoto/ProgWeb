<?php

/* @var $this yii\web\View */

use yii\helpers\Html;
$this->title = 'Gomoku Game';
?>
<div class="site-gomoku">
  <h2>Gomoku</h2>
<?=$this->registerCssFile('@web/css/Gomoku.css');?>
  <button id="iniciar" type="button">Iniciar</button>

  <?= Html::img('@web/image/gomoku.png') ?>
        <!-- <p><a class="btn btn-lg btn-success" href="http://www.yiiframework.com">Get started with Yii</a></p> -->

  <table id="tabuleiro">
	</table>

  <div id="divP1">
		<div id="jogadordavez">Jogador da Vez</div>
		<div>
			<div id="peca1">
				<img src="Image/Peça1.png">
			</div>
			<div id="peca2">
				<img src="Image/Peça2.png">
			</div>
		</div>
	</div>

	<div id="win">
		<div id="win_1">
			<div id="win_2">

					<span type"button" id="close_win">x</span>
					 <img id="winner" src="Image/Peça1.png">
				<p id="win_3">VENCEU !</p>
			</div>
		</div>
	</div>
	<script type="text/javascript" src="Gomoku.js" >
	</script>

  <?=$this->registerJsFile('@web/js/Gomoku.js', [
      'position' => $this::POS_END
    ]);?>

</div>
