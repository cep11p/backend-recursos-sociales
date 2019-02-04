<?php

use yii\db\Migration;

/**
 * Class m190204_160021_insert_tipo_recurso
 */
class m190204_160021_insert_tipo_recurso extends Migration
{
    /**
     * {@inheritdoc}
     */
    public function safeUp()
    {
        $table = 'tipo_recurso';
        $this->insert($table,["nombre"=>"Alimentación"]);
        $this->insert($table,["nombre"=>"Empleo/Formación Laboral"]);
        $this->insert($table,["nombre"=>"Mejora Habitacional"]);

    }

    /**
     * {@inheritdoc}
     */
    public function safeDown()
    {
        echo "m190204_160021_insert_tipo_recurso cannot be reverted.\n";

        return false;
    }

    /*
    // Use up()/down() to run migration code without a transaction.
    public function up()
    {

    }

    public function down()
    {
        echo "m190204_160021_insert_tipo_recurso cannot be reverted.\n";

        return false;
    }
    */
}
