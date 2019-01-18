<?php

use yii\helpers\Html;

/**
* @var yii\web\View $this
* @var app\models\ProgramaHasTipoRecurso $model
*/

$this->title = Yii::t('models', 'Programa Has Tipo Recurso');
$this->params['breadcrumbs'][] = ['label' => Yii::t('models', 'Programa Has Tipo Recursos'), 'url' => ['index']];
$this->params['breadcrumbs'][] = $this->title;
?>
<div class="giiant-crud programa-has-tipo-recurso-create">

    <h1>
        <?= Yii::t('models', 'Programa Has Tipo Recurso') ?>
        <small>
                        <?= Html::encode($model->tipo_recursoid) ?>
        </small>
    </h1>

    <div class="clearfix crud-navigation">
        <div class="pull-left">
            <?=             Html::a(
            'Cancel',
            \yii\helpers\Url::previous(),
            ['class' => 'btn btn-default']) ?>
        </div>
    </div>

    <hr />

    <?= $this->render('_form', [
    'model' => $model,
    ]); ?>

</div>
