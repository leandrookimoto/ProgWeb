<?php

use yii\helpers\Html;
use yii\grid\GridView;
use common\models\User;
/* @var $this yii\web\View */
/* @var $searchModel common\models\PartidaSearch */
/* @var $dataProvider yii\data\ActiveDataProvider */

$this->title = 'Partidas';
$this->params['breadcrumbs'][] = $this->title;
?>
<div class="partida-index">

    <h1><?= Html::encode($this->title) ?></h1>
    <?php // echo $this->render('_search', ['model' => $searchModel]); ?>

    <p>
        <?= Html::a('Iniciar Partida', ['create'], ['class' => 'btn btn-success']) ?>
    </p>
    <?= GridView::widget([
        'dataProvider' => $dataProvider,
        'filterModel' => $searchModel,
        'columns' => [
            //['class' => 'yii\grid\SerialColumn'],

            //'id',
            [
              'attribute'=> 'id_user_1',
              'value'=>function($model){
                return User::findOne($model->id_user_1)->username;
              }
            ],
            [
              'attribute'=> 'id_user_2',
              'value'=>function($model){
                return User::findOne($model->id_user_2)->username;
              }
            ],
            [
              'attribute'=> 'vencedor',
              'value'=>function($model){
                return User::findOne($model->vencedor)->username;
              }
            ],
            //'id_user_1',
            // 'id_user_2',
            // 'vencedor',

            ['class' => 'yii\grid\ActionColumn'],
        ],
    ]); ?>
</div>
