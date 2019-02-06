<?php

use yii\db\Migration;

/**
 * Class m190206_014505_aula_new_table
 */
class m190206_014505_aula_new_table extends Migration
{
    /**
     * {@inheritdoc}
     */
    public function safeUp()
    {
        $table = "aula";
        $this->createTable($table, [
            'recurso_socialid'=> $this->integer()->notNull(),
            'alumnoid'=> $this->integer()->notNull(),
            'PRIMARY KEY(recurso_socialid, alumnoid)',
        ]);
        
        $this->addForeignKey('fk_aula_recurso_socialid', $table, 'recurso_socialid', 'recurso', 'id');

    }

    /**
     * {@inheritdoc}
     */
    public function safeDown()
    {
        echo "m190206_014505_aula_new_table cannot be reverted.\n";

        return false;
    }

    /*
    // Use up()/down() to run migration code without a transaction.
    public function up()
    {

    }

    public function down()
    {
        echo "m190206_014505_aula_new_table cannot be reverted.\n";

        return false;
    }
    */
}
