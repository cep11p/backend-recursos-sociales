<?php

use yii\db\Migration;

/**
 * Class m201223_123304_permisos
 */
class m201223_123304_permisos extends Migration
{
    /**
     * {@inheritdoc}
     */
    public function safeUp()
    {
        $tableName = 'auth_item';        
        $this->insert($tableName, ['name'=>'1_crear','type'=>2,'description'=>'Permite crear una prestaciones de su programa','created_at'=>time()]);
        $this->insert($tableName, ['name'=>'1_ver','type'=>2,'description'=>'Permite ver prestaciones de su programa','created_at'=>time()]);
        $this->insert($tableName, ['name'=>'1_baja','type'=>2,'description'=>'Permite dar de baja prestaciones de su programa','created_at'=>time()]);
        $this->insert($tableName, ['name'=>'1_acreditar','type'=>2,'description'=>'Permite acreditar prestaciones de su programa','created_at'=>time()]);
        
        $this->insert($tableName, ['name'=>'2_crear','type'=>2,'description'=>'Permite crear una prestaciones de su programa','created_at'=>time()]);
        $this->insert($tableName, ['name'=>'2_ver','type'=>2,'description'=>'Permite ver prestaciones de su programa','created_at'=>time()]);
        $this->insert($tableName, ['name'=>'2_baja','type'=>2,'description'=>'Permite dar de baja prestaciones de su programa','created_at'=>time()]);
        $this->insert($tableName, ['name'=>'2_acreditar','type'=>2,'description'=>'Permite acreditar prestaciones de su programa','created_at'=>time()]);
    
        $this->insert($tableName, ['name'=>'3_crear','type'=>2,'description'=>'Permite crear una prestaciones de su programa','created_at'=>time()]);
        $this->insert($tableName, ['name'=>'3_ver','type'=>2,'description'=>'Permite ver prestaciones de su programa','created_at'=>time()]);
        $this->insert($tableName, ['name'=>'3_baja','type'=>2,'description'=>'Permite dar de baja prestaciones de su programa','created_at'=>time()]);
        $this->insert($tableName, ['name'=>'3_acreditar','type'=>2,'description'=>'Permite acreditar prestaciones de su programa','created_at'=>time()]);

        $this->insert($tableName, ['name'=>'4_crear','type'=>2,'description'=>'Permite crear una prestaciones de su programa','created_at'=>time()]);
        $this->insert($tableName, ['name'=>'4_ver','type'=>2,'description'=>'Permite ver prestaciones de su programa','created_at'=>time()]);
        $this->insert($tableName, ['name'=>'4_baja','type'=>2,'description'=>'Permite dar de baja prestaciones de su programa','created_at'=>time()]);
        $this->insert($tableName, ['name'=>'4_acreditar','type'=>2,'description'=>'Permite acreditar prestaciones de su programa','created_at'=>time()]);

        $this->insert($tableName, ['name'=>'5_crear','type'=>2,'description'=>'Permite crear una prestaciones de su programa','created_at'=>time()]);
        $this->insert($tableName, ['name'=>'5_ver','type'=>2,'description'=>'Permite ver prestaciones de su programa','created_at'=>time()]);
        $this->insert($tableName, ['name'=>'5_baja','type'=>2,'description'=>'Permite dar de baja prestaciones de su programa','created_at'=>time()]);
        $this->insert($tableName, ['name'=>'5_acreditar','type'=>2,'description'=>'Permite acreditar prestaciones de su programa','created_at'=>time()]);

        $this->insert($tableName, ['name'=>'6_crear','type'=>2,'description'=>'Permite crear una prestaciones de su programa','created_at'=>time()]);
        $this->insert($tableName, ['name'=>'6_ver','type'=>2,'description'=>'Permite ver prestaciones de su programa','created_at'=>time()]);
        $this->insert($tableName, ['name'=>'6_baja','type'=>2,'description'=>'Permite dar de baja prestaciones de su programa','created_at'=>time()]);
        $this->insert($tableName, ['name'=>'6_acreditar','type'=>2,'description'=>'Permite acreditar prestaciones de su programa','created_at'=>time()]);

    }

    /**
     * {@inheritdoc}
     */
    public function safeDown()
    {
        echo "m201223_123304_permisos cannot be reverted.\n";

        return false;
    }

    /*
    // Use up()/down() to run migration code without a transaction.
    public function up()
    {

    }

    public function down()
    {
        echo "m201223_123304_permisos cannot be reverted.\n";

        return false;
    }
    */
}
