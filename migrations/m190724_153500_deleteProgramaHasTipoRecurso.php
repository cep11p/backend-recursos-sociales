<?php

use yii\db\Migration;

/**
 * Class m190724_153500_deleteProgramaHasTipoRecurso
 */
class m190724_153500_deleteProgramaHasTipoRecurso extends Migration
{
    /**
     * {@inheritdoc}
     */
    public function safeUp()
    {
        $table = "programa_has_tipo_recurso";
        $this->delete($table, ['programaid'=>1,'tipo_recursoid'=>2]);
    }

    /**
     * {@inheritdoc}
     */
    public function safeDown()
    {
        echo "m190724_153500_deleteProgramaHasTipoRecurso cannot be reverted.\n";

        return false;
    }

    /*
    // Use up()/down() to run migration code without a transaction.
    public function up()
    {

    }

    public function down()
    {
        echo "m190724_153500_deleteProgramaHasTipoRecurso cannot be reverted.\n";

        return false;
    }
    */
}
