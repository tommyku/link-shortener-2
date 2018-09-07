TIME_TO_EXPIRE = 5 * 60

while true do
  files = Dir.glob("/run/links/*")
  expiryCutOff = Time.now - TIME_TO_EXPIRE
  files.each do |file|
    ctime = File.ctime(file)
    if ctime < expiryCutOff
      File.unlink(file)
    end
  end

  sleep(TIME_TO_EXPIRE)
end
