namespace :db do
  task seed: :seed_helper

  task :seed_helper do
    def seed(model, find_or_create_by, update_with = {})
      record = model.where(find_or_create_by).first_or_initialize

      if record.update_attributes(update_with)
        record
      else
        raise "Couldn't save #{record.class} (#{record.errors.full_messages.join(', ')})"
      end
    end
  end
end