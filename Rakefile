require "rabbit/task/slide"

# Edit ./config.yaml to customize meta data

spec = nil
Rabbit::Task::Slide.new do |task|
  spec = task.spec
  spec.files += Dir.glob("images/**/*.*")
  spec.files += Dir.glob("throughput*")
  # spec.files -= Dir.glob("private/**/*.*")
  spec.add_runtime_dependency("rabbit-theme-groonga")
end

desc "Tag #{spec.version}"
task :tag do
  sh("git", "tag", "-a", spec.version.to_s, "-m", "Publish #{spec.version}")
  sh("git", "push", "--tags")
end

pdfs = [
  "throughput-no-keep-alive.pdf",
  "throughput-with-keep-alive.pdf",
]

pdfs.each do |pdf|
  file pdf => ["throughput.gnuplot", "throughput.data"] do
    sh("gnuplot", "throughput.gnuplot")
  end
end

desc "Generate graphs"
task :graph => pdfs

task :run => :graph
