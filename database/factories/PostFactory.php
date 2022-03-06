<?php

namespace Database\Factories;

use App\Models\Post;
use Illuminate\Database\Eloquent\Factories\Factory;

class PostFactory extends Factory
{
    /**
     * The name of the factory's corresponding model.
     *
     * @var string
     */
    protected $model = Post::class;

    /**
     * Define the model's default state.
     *
     * @return array
     */
    public function definition()
    {
        return [
            'title' => $this->faker->sentence(),
            'content' => $this->faker->sentence(),
            'description' => $this->faker->sentence(),
            'image' => '../img/photo1.png',
            'date' => '03/11/21',
            'views' => $this->faker->numberBetween(0, 5000),
            'category_id' => 6,
            'user_id'   => 1,
            'status'    => 1,
            'is_featured'  => 0,
        ];
    }
}
