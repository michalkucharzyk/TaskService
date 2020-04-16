<?php

use Illuminate\Database\Seeder;

class TaskTableSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        $faker = \Faker\Factory::create();
        for ($i = 0; $i < 5; $i++) {
            $task = new \App\Task();
            $task->id_user = 1;
            $task->name =$faker->jobTitle;
            $task->description = $faker->text;
            $task->start_task = $faker->dateTimeBetween('-60 days', '-40 days');
            $task->end_task = $faker->dateTimeBetween('-30 days', '+ 10 days');
            $task->status = 1;
            $task->timestamps;
            $task->save();
        }
    }
}
