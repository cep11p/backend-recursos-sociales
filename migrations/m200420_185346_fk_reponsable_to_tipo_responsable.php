<?php

use yii\db\Migration;

/**
 * Class m200420_185346_fk_reponsable_to_tipo_responsable
 */
class m200420_185346_fk_reponsable_to_tipo_responsable extends Migration
{
    /**
     * {@inheritdoc}
     */
    public function safeUp()
    {
        $table = 'responsable_entrega';
        $this->addForeignKey('fk_tipo_responsableid', $table, 'tipo_responsableid', 'tipo_responsable', 'id');
    }

    /**
     * {@inheritdoc}
     */
    public function safeDown()
    {
        echo "m200420_185346_fk_reponsable_to_tipo_responsable cannot be reverted.\n";

        return false;
    }

    /*
    // Use up()/down() to run migration code without a transaction.
    public function up()
    {

    }

    public function down()
    {
        echo "m200420_185346_fk_reponsable_to_tipo_responsable cannot be reverted.\n";

        return false;
    }
    */
}
