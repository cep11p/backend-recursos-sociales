<?php

use yii\db\Migration;

/**
 * Class m200429_165019_programaColor
 */
class m200429_165019_programaColor extends Migration
{
    /**
     * {@inheritdoc}
     */
    public function safeUp()
    {
        $table = 'programa';
        $this->addColumn($table, 'color', $this->string(15)->notNull());
        
        $this->update($table, ['color'=>'#FF6B37'], ['id'=>1]);
        $this->update($table, ['color'=>'#ABDF7D'], ['id'=>2]);
        $this->update($table, ['color'=>'#FFC837'], ['id'=>3]);
        $this->update($table, ['color'=>'#FFF637'], ['id'=>4]);
        $this->update($table, ['color'=>'#4AF9C1'], ['id'=>5]);
        $this->update($table, ['color'=>'#7DDEFF'], ['id'=>6]);

    }

    /**
     * {@inheritdoc}
     */
    public function safeDown()
    {
        echo "m200429_165019_programaColor cannot be reverted.\n";

        return false;
    }

    /*
    // Use up()/down() to run migration code without a transaction.
    public function up()
    {

    }

    public function down()
    {
        echo "m200429_165019_programaColor cannot be reverted.\n";

        return false;
    }
    */
}
