<?php

use yii\db\Migration;

/**
 * Class m200413_181257_modulo_alimenticio
 */
class m200413_181257_modulo_alimenticio extends Migration
{
    /**
     * {@inheritdoc}
     */
    public function safeUp()
    {
        $table = 'recurso';
        $this->addColumn($table, 'responsable_entregaid', $this->integer());
        $this->addColumn($table, 'cant_modulo', $this->integer());
        
        $this->addForeignKey('fk_responsable', $table, 'responsable_entregaid', 'responsable', 'id');
        
        $this->insert('programa', ['nombre'=>'Modulo Alimenticio']);
        $this->insert('tipo_recurso', ['nombre'=>'Emergencia']);
    }

    /**
     * {@inheritdoc}
     */
    public function safeDown()
    {
        echo "m200413_181257_modulo_alimenticio cannot be reverted.\n";

        return false;
    }

    /*
    // Use up()/down() to run migration code without a transaction.
    public function up()
    {

    }

    public function down()
    {
        echo "m200413_181257_modulo_alimenticio cannot be reverted.\n";

        return false;
    }
    */
}
