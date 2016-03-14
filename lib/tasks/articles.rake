namespace :articles do
  desc "Deleting old articles"
  task check_old: :environment do
    ArticleCheckerJob.perform_later
  end
end
