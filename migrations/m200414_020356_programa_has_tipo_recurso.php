<?php

use yii\db\Migration;

/**
 * Class m200414_020356_programa_has_tipo_recurso
 */
class m200414_020356_programa_has_tipo_recurso extends Migration
{
    /**
     * {@inheritdoc}
     */
    public function safeUp()
    {
        $table = 'programa_has_tipo_recurso';
        $this->insert($table, ['tipo_recursoid'=>4,'programaid'=>6]);
    }

    /**
     * {@inheritdoc}
     */
    public function safeDown()
    {
        echo "m200414_020356_programa_has_tipo_recurso cannot be reverted.\n";

        return false;
    }

    /*
    // Use up()/down() to run migration code without a transaction.
    public function up()
    {

    }

    public function down()
    {
        echo "m200414_020356_programa_has_tipo_recurso cannot be reverted.\n";

        return false;
    }
    */
}
