<?php

use yii\db\Migration;

/**
 * Class m210326_144149_new_table_cuota
 */
class m210326_144149_new_table_cuota extends Migration
{
    /**
     * {@inheritdoc}
     */
    public function safeUp()
    {
        $table = 'cuota';
        $this->createTable($table, [
            'id'=>$this->primaryKey(),
            'monto'=>$this->double(),
            'recursoid'=>$this->integer()->notNull(),
            'fecha_pago'=>$this->date()
        ]);

        $this->addForeignKey('fk_cuota_recursoid', $table, 'recursoid', 'recurso', 'id','cascade','cascade');
    }

    /**
     * {@inheritdoc}
     */
    public function safeDown()
    {
        echo "m210326_144149_new_table_cuota cannot be reverted.\n";

        return false;
    }

    /*
    // Use up()/down() to run migration code without a transaction.
    public function up()
    {

    }

    public function down()
    {
        echo "m210326_144149_new_table_cuota cannot be reverted.\n";

        return false;
    }
    */
}
