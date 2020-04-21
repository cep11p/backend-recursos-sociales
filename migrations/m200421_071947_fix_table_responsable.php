<?php

use yii\db\Migration;

/**
 * Class m200421_071947_fix_table_responsable
 */
class m200421_071947_fix_table_responsable extends Migration
{
    /**
     * {@inheritdoc}
     */
    public function safeUp()
    {
        
        $table = 'responsable_entrega';
        $this->dropColumn($table, 'id');
        $this->dropColumn($table, 'responsableid');

        $this->addColumn($table, 'recursoid', $this->primaryKey());
        $this->addColumn($table, 'responsable_entregaid', $this->integer());
        
        $this->addForeignKey('fk_recurso', $table, 'recursoid', 'recurso', 'id');
    }

    /**
     * {@inheritdoc}
     */
    public function safeDown()
    {
        echo "m200421_071947_fix_table_responsable cannot be reverted.\n";

        return false;
    }

    /*
    // Use up()/down() to run migration code without a transaction.
    public function up()
    {

    }

    public function down()
    {
        echo "m200421_071947_fix_table_responsable cannot be reverted.\n";

        return false;
    }
    */
}
