require 'rails_helper'

describe Task do

  it "validates that the due date is not in the past" do
    task = Task.new(due_date: "1/1/1900")
    task.valid?
    expect(task.errors[:due_date].present?).to eq(true)

    task.due_date = Time.now + 7.days
    task.valid?
    expect(task.errors[:due_date].present?).to eq(false)

  end

end
