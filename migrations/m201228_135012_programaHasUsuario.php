<?php

use yii\db\Migration;

/**
 * Class m201228_135012_programaHasUsuario
 */
class m201228_135012_programaHasUsuario extends Migration
{
    /**
     * {@inheritdoc}
     */
    public function safeUp()
    {
        $tableName = 'programa_has_usuario';
        $this->createTable($tableName, [
            'id'=>$this->primaryKey(),
            'userid'=>$this->integer(),
            'programaid'=>$this->integer(),
            'permiso'=>$this->string(64),
            'create_at'=>$this->timestamp()
        ]);

        $this->addForeignKey('fk_user', $tableName, 'userid', 'user', 'id');
        $this->addForeignKey('fk_programa', $tableName, 'programaid', 'programa', 'id');
    }

    /**
     * {@inheritdoc}
     */
    public function safeDown()
    {
        echo "m201228_135012_programaHasUsuario cannot be reverted.\n";

        return false;
    }

    /*
    // Use up()/down() to run migration code without a transaction.
    public function up()
    {

    }

    public function down()
    {
        echo "m201228_135012_programaHasUsuario cannot be reverted.\n";

        return false;
    }
    */
}
