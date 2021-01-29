<?php

use yii\db\Migration;

/**
 * Class m210128_145420_usuario_last_login_ip
 */
class m210128_145420_usuario_last_login_ip extends Migration
{
    /**
     * {@inheritdoc}
     */
    public function safeUp()
    {
        $this->addColumn('user_persona', 'last_login_ip', $this->string('20'));
    }

    /**
     * {@inheritdoc}
     */
    public function safeDown()
    {
        echo "m210128_145420_usuario_last_login_ip cannot be reverted.\n";

        return false;
    }

    /*
    // Use up()/down() to run migration code without a transaction.
    public function up()
    {

    }

    public function down()
    {
        echo "m210128_145420_usuario_last_login_ip cannot be reverted.\n";

        return false;
    }
    */
}
