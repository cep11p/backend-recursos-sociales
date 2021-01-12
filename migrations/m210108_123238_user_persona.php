<?php

use yii\db\Migration;

/**
 * Class m210108_123238_user_persona
 */
class m210108_123238_user_persona extends Migration
{
    /**
     * {@inheritdoc}
     */
    public function safeUp()
    {
        $table = 'user_persona';
        $this->createTable($table,[
            'userid'=>$this->primaryKey(),
            'personaid'=>$this->integer()->notNull(),
            'localidadid'=>$this->integer()->notNull()
        ]);

        $this->addForeignKey('fk_user_persona', $table, 'userid', 'user', 'id', 'CASCADE', 'CASCADE');

    }

    /**
     * {@inheritdoc}
     */
    public function safeDown()
    {
        echo "m210108_123238_user_persona cannot be reverted.\n";

        return false;
    }

    /*
    // Use up()/down() to run migration code without a transaction.
    public function up()
    {

    }

    public function down()
    {
        echo "m210108_123238_user_persona cannot be reverted.\n";

        return false;
    }
    */
}
