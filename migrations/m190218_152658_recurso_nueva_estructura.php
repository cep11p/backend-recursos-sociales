<?php

use yii\db\Migration;

/**
 * Class m190218_152658_recurso_nueva_estructura
 */
class m190218_152658_recurso_nueva_estructura extends Migration
{
    /**
     * {@inheritdoc}
     */
    public function safeUp()
    {
        $table='recurso';
        $this->addColumn($table, 'fecha_baja', 'date');
        $this->addColumn($table, 'fecha_acreditacion', 'date');
        $this->addColumn($table, 'descripcion_baja', 'text');
    }

    /**
     * {@inheritdoc}
     */
    public function safeDown()
    {
        echo "m190218_152658_recurso_nueva_estructura cannot be reverted.\n";

        return false;
    }

    /*
    // Use up()/down() to run migration code without a transaction.
    public function up()
    {

    }

    public function down()
    {
        echo "m190218_152658_recurso_nueva_estructura cannot be reverted.\n";

        return false;
    }
    */
}
