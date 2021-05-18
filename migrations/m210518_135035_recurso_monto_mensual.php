<?php

use yii\db\Migration;

/**
 * Class m210518_135035_recurso_monto_mensual
 */
class m210518_135035_recurso_monto_mensual extends Migration
{
    /**
     * {@inheritdoc}
     */
    public function safeUp()
    {
        $this->addColumn('recurso', 'monto_mensual', $this->double());

    }

    /**
     * {@inheritdoc}
     */
    public function safeDown()
    {
        echo "m210518_135035_recurso_monto_mensual cannot be reverted.\n";

        return false;
    }

    /*
    // Use up()/down() to run migration code without a transaction.
    public function up()
    {

    }

    public function down()
    {
        echo "m210518_135035_recurso_monto_mensual cannot be reverted.\n";

        return false;
    }
    */
}
