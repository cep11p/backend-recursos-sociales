<?php

use yii\db\Migration;

/**
 * Class m210518_135411_recurso_lugar_capacitacion
 */
class m210518_135411_recurso_lugar_capacitacion extends Migration
{
    /**
     * {@inheritdoc}
     */
    public function safeUp()
    {
        $this->addColumn('recurso', 'lugar_capacitacion', $this->string(255));
    }

    /**
     * {@inheritdoc}
     */
    public function safeDown()
    {
        echo "m210518_135411_recurso_lugar_capacitacion cannot be reverted.\n";

        return false;
    }

    /*
    // Use up()/down() to run migration code without a transaction.
    public function up()
    {

    }

    public function down()
    {
        echo "m210518_135411_recurso_lugar_capacitacion cannot be reverted.\n";

        return false;
    }
    */
}
