# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2019_01_30_082800) do

  create_table "comment_lessons", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.text "content"
    t.bigint "user_id"
    t.bigint "lesson_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["lesson_id", "created_at"], name: "index_comment_lessons_on_lesson_id_and_created_at"
    t.index ["lesson_id"], name: "index_comment_lessons_on_lesson_id"
    t.index ["user_id", "created_at"], name: "index_comment_lessons_on_user_id_and_created_at"
    t.index ["user_id"], name: "index_comment_lessons_on_user_id"
  end

  create_table "course_users", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.boolean "status"
    t.decimal "debit", precision: 10
    t.bigint "user_id"
    t.bigint "course_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["course_id", "created_at"], name: "index_course_users_on_course_id_and_created_at"
    t.index ["course_id"], name: "index_course_users_on_course_id"
    t.index ["user_id", "created_at"], name: "index_course_users_on_user_id_and_created_at"
    t.index ["user_id"], name: "index_course_users_on_user_id"
  end

  create_table "courses", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.bigint "subject_id"
    t.bigint "user_id"
    t.string "name_class"
    t.string "quantity"
    t.date "start_time"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["subject_id", "created_at"], name: "index_courses_on_subject_id_and_created_at"
    t.index ["subject_id"], name: "index_courses_on_subject_id"
    t.index ["user_id", "created_at"], name: "index_courses_on_user_id_and_created_at"
    t.index ["user_id"], name: "index_courses_on_user_id"
  end

  create_table "exercises", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.text "question"
    t.text "detailed_answer"
    t.integer "lesson_number"
    t.bigint "subject_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["subject_id", "created_at"], name: "index_exercises_on_subject_id_and_created_at"
    t.index ["subject_id"], name: "index_exercises_on_subject_id"
  end

  create_table "exercises_answers", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.text "content"
    t.boolean "is_current"
    t.bigint "exercise_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["exercise_id", "created_at"], name: "index_exercises_answers_on_exercise_id_and_created_at"
    t.index ["exercise_id"], name: "index_exercises_answers_on_exercise_id"
  end

  create_table "homework_results", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.decimal "total_score", precision: 10
    t.decimal "reward_points", precision: 10
    t.text "comment"
    t.bigint "user_id"
    t.bigint "homework_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["homework_id", "created_at"], name: "index_homework_results_on_homework_id_and_created_at"
    t.index ["homework_id"], name: "index_homework_results_on_homework_id"
    t.index ["user_id", "created_at"], name: "index_homework_results_on_user_id_and_created_at"
    t.index ["user_id"], name: "index_homework_results_on_user_id"
  end

  create_table "homeworks", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "name_homework"
    t.integer "lesson_number"
    t.string "total_exercise"
    t.bigint "lesson_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["lesson_id", "created_at"], name: "index_homeworks_on_lesson_id_and_created_at"
    t.index ["lesson_id"], name: "index_homeworks_on_lesson_id"
  end

  create_table "homeworks_details", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.bigint "homework_id"
    t.bigint "exercise_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["exercise_id", "created_at"], name: "index_homeworks_details_on_exercise_id_and_created_at"
    t.index ["exercise_id"], name: "index_homeworks_details_on_exercise_id"
    t.index ["homework_id", "created_at"], name: "index_homeworks_details_on_homework_id_and_created_at"
    t.index ["homework_id"], name: "index_homeworks_details_on_homework_id"
  end

  create_table "lesson_videos", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.bigint "lesson_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["lesson_id", "created_at"], name: "index_lesson_videos_on_lesson_id_and_created_at"
    t.index ["lesson_id"], name: "index_lesson_videos_on_lesson_id"
  end

  create_table "lessons", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "title"
    t.string "content"
    t.bigint "user_id"
    t.bigint "course_id"
    t.bigint "video_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["course_id", "created_at"], name: "index_lessons_on_course_id_and_created_at"
    t.index ["course_id"], name: "index_lessons_on_course_id"
    t.index ["user_id", "created_at"], name: "index_lessons_on_user_id_and_created_at"
    t.index ["user_id"], name: "index_lessons_on_user_id"
    t.index ["video_id", "created_at"], name: "index_lessons_on_video_id_and_created_at"
    t.index ["video_id"], name: "index_lessons_on_video_id"
  end

  create_table "subjects", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "name_subject"
    t.string "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "email"
    t.string "fullname"
    t.date "birth"
    t.integer "gender"
    t.string "address"
    t.string "numberphone"
    t.integer "role", default: 0, null: false
    t.string "avt"
    t.boolean "active"
    t.string "password_digest"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
  end

  create_table "videos", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "name_video"
    t.string "link"
    t.integer "lesson_number"
    t.string "description"
    t.bigint "subject_id"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["subject_id", "created_at"], name: "index_videos_on_subject_id_and_created_at"
    t.index ["subject_id"], name: "index_videos_on_subject_id"
    t.index ["user_id", "created_at"], name: "index_videos_on_user_id_and_created_at"
    t.index ["user_id"], name: "index_videos_on_user_id"
  end

  add_foreign_key "comment_lessons", "lessons"
  add_foreign_key "comment_lessons", "users"
  add_foreign_key "course_users", "courses"
  add_foreign_key "course_users", "users"
  add_foreign_key "courses", "subjects"
  add_foreign_key "courses", "users"
  add_foreign_key "exercises", "subjects"
  add_foreign_key "exercises_answers", "exercises"
  add_foreign_key "homework_results", "homeworks"
  add_foreign_key "homework_results", "users"
  add_foreign_key "homeworks", "lessons"
  add_foreign_key "homeworks_details", "exercises"
  add_foreign_key "homeworks_details", "homeworks"
  add_foreign_key "lesson_videos", "lessons"
  add_foreign_key "lessons", "courses"
  add_foreign_key "lessons", "users"
  add_foreign_key "lessons", "videos"
  add_foreign_key "videos", "subjects"
  add_foreign_key "videos", "users"
end
