<?php

use yii\helpers\Html;
use yii\widgets\DetailView;
use common\models\User;
use common\models\Jogada;
use yii\widgets\Pjax;
/* @var $this yii\web\View */
/* @var $model common\models\Partida */


$this->title = User::findOne($model->id_user_1)->username. " X ";
$this->title .= User::findOne($model->id_user_2)->username?User::findOne($model->id_user_2)->username:"...";
$this->params['breadcrumbs'][] = ['label' => 'Partidas', 'url' => ['index']];
$this->params['breadcrumbs'][] = $this->title;




// $this->registerJsFile('@web/Gomoku.js', [
//     'position' => $this::POS_END
//   ]);
//
// if (!$vencedor) {
// $this->registerJs('
//     setInterval(function() {
//         recarregar = document.getElementById("recarregar");
//         recarregar.click();
//     }, 1000);
// ');
// }


?>
<div class="partida-view">

    <h1><?= Html::encode($this->title) ?></h1>



    <?=$this->registerCssFile('@web/css/Gomoku.css');?>

    <?php Pjax::begin(); ?>

        <!-- ADICIONAR: DetailView contendo os participantes do jogo -->
          <?php
          $this->title = User::findOne($model->id_user_1)->username. " X ";
          $this->title .= User::findOne($model->id_user_2)->username?User::findOne($model->id_user_2)->username:"...";
           ?>
            <?=
                DetailView::widget([
                'model' => $model,
                'attributes' => [
                  //  'id',
                    //'id_user_1',
                    [
                      'attribute'=> 'id_user_1',
                      'label'=> Html::img('@web/image/Peça1.png',['style'=>'width:30px; height:30px','id'=>'peca1']).' Jogador 1',
                      'value'=>User::findOne($model->id_user_1)->username
                    ],
                    [
                      'attribute'=> 'id_user_2',
                      'label'=> Html::img('@web/image/Peça2.png',['style'=>'width:30px; height:30px','id'=>'peca2']).' Jogador 2',
                      'value'=>User::findOne($model->id_user_2)->username
                    ],
                    [
                      'attribute'=> 'vencedor',
                      'value'=>User::findOne($model->vencedor)->username
                    ],

                ],
            ]) ?>
        <!-- Link usado pelo Pjax, para carregar o tabuleiro a cada segundo -->
        <?= Html::a('Recarregar',['partida/view','id'=>$model->id],['id'=>'recarregar','style'=>'display:none']) ?>

        <div class="container">

            <table id='tabuleiro'>
              <?php
              for ($i=0; $i <=16 ; $i++) {
                echo "<tr>";
                for ($j=0; $j <=16 ; $j++) {
                  echo "<td>";

                  if ($i==0 && $j==0) {
                      echo "<img src=\"/progweb/gomoku/advanced/frontend/web/image/P1.png\">";
                  }else if ($i==0 && $j==16) {
                        echo "<img src=\"/progweb/gomoku/advanced/frontend/web/image/P3.png\">";
                  }else if ($i==16 && $j==0) {
                        echo "<img src=\"/progweb/gomoku/advanced/frontend/web/image/P7.png\">";
                  }else if ($i==16 && $j==16) {
                        echo "<img src=\"/progweb/gomoku/advanced/frontend/web/image/P9.png\">";
                  }else if($i==0){
                        echo "<img src=\"/progweb/gomoku/advanced/frontend/web/image/P2.png\">";
                  }else if($j==0){
                        echo "<img src=\"/progweb/gomoku/advanced/frontend/web/image/P4.png\">";
                  }else if($i==16){
                        echo "<img src=\"/progweb/gomoku/advanced/frontend/web/image/P8.png\">";
                  }else if($j==16){
                        echo "<img src=\"/progweb/gomoku/advanced/frontend/web/image/P6.png\">";
                  }else{
                        echo Html::a('<img id="'.$i.'"-"'.$j.' src="/progweb/gomoku/advanced/frontend/web/image/P5.png">',
                        ['partida/view','id'=>$model->id,'linha'=>$row,'coluna'=>$col]);
                  }

                  echo "</td>";
                }
                echo "</tr>";
              }
               ?>
            </table>
            <?php
              foreach ($jogadas as $jogada) {
                echo $jogada->coluna;
                echo $jogada->linha;

                if ($jogada->id_user === $model->id_user_1) {
                  $this->registerJs('
                  var i = '.$jogada->linha.';
                  var j = '.$jogada->coluna.';
                  var id = i+\'-\'j;
                  var img = document.getElementById(element.target.id);
                  img.src = \"/progweb/gomoku/advanced/frontend/web/image/P5b.png\";
                  ');
                }
              }
             ?>
        </div>

    <?php Pjax::end(); ?>


    <div id="win">
      <div id="win_1">
        <div id="win_2">

            <span type"button" id="close_win">x</span>
             <img id="winner" src="Image/Peça1.png">
          <p id="win_3">VENCEU !</p>
        </div>
      </div>
    </div>




</div>
