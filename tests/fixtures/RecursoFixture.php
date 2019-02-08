<?php

namespace app\tests\fixtures;
use yii\test\ActiveFixture;

class RecursoFixture extends ActiveFixture{
    
    public $modelClass = '\app\models\Recurso';
    
    public function init() {
        $this ->dataFile = \Yii::getAlias('@app').'/tests/_data/recurso.php';
        parent::init();
    }
    
    public function unload()
    {
        parent::unload();
        $this->resetTable();
    }
    
}

