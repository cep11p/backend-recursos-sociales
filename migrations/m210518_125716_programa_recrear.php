<?php

use yii\db\Migration;

/**
 * Class m210518_125716_programa_recrear
 */
class m210518_125716_programa_recrear extends Migration
{
    /**
     * {@inheritdoc}
     */
    public function safeUp()
    {
        $this->insert('programa', [
            'nombre' => 'Recrear',
            'color' => '#A2AFFF' 
            ]);
    }

    /**
     * {@inheritdoc}
     */
    public function safeDown()
    {
        echo "m210518_125716_programa_recrear cannot be reverted.\n";

        return false;
    }

    /*
    // Use up()/down() to run migration code without a transaction.
    public function up()
    {

    }

    public function down()
    {
        echo "m210518_125716_programa_recrear cannot be reverted.\n";

        return false;
    }
    */
}
