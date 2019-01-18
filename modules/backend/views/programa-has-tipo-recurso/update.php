<?php

use yii\helpers\Html;

/**
* @var yii\web\View $this
* @var app\models\ProgramaHasTipoRecurso $model
*/

$this->title = Yii::t('models', 'Programa Has Tipo Recurso');
$this->params['breadcrumbs'][] = ['label' => Yii::t('models', 'Programa Has Tipo Recurso'), 'url' => ['index']];
$this->params['breadcrumbs'][] = ['label' => (string)$model->tipo_recursoid, 'url' => ['view', 'tipo_recursoid' => $model->tipo_recursoid, 'programaid' => $model->programaid]];
$this->params['breadcrumbs'][] = 'Edit';
?>
<div class="giiant-crud programa-has-tipo-recurso-update">

    <h1>
        <?= Yii::t('models', 'Programa Has Tipo Recurso') ?>
        <small>
                        <?= Html::encode($model->tipo_recursoid) ?>
        </small>
    </h1>

    <div class="crud-navigation">
        <?= Html::a('<span class="glyphicon glyphicon-file"></span> ' . 'View', ['view', 'tipo_recursoid' => $model->tipo_recursoid, 'programaid' => $model->programaid], ['class' => 'btn btn-default']) ?>
    </div>

    <hr />

    <?php echo $this->render('_form', [
    'model' => $model,
    ]); ?>

</div>
