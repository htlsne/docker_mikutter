#-*- config: utf-8 -*-

require 'fileutils'
require 'logger'

posts = [
    "hello",
    "こんにちは",
    "你好",
    "안녕하세요",
    "Hallo",
    "Buon giorno",
    "God dag",
    "Guten tag",
    "Bonjour",
    "Καλημερα",
    "Здравствуйте",
    "नमस्ते"
]

Plugin.create(:daemon) do
  DAEMON_LOGDIR  = File.join(CHIConfig::LOGDIR, 'daemon')
  DAEMON_LOGFILE = STDOUT

  def request_token()
    twitter = MikuTwitter.new
    twitter.consumer_key = Environment::TWITTER_CONSUMER_KEY
    twitter.consumer_secret = Environment::TWITTER_CONSUMER_SECRET
    req = twitter.request_oauth_token
    puts req.authorize_url
    print "code: "
    code = STDIN.gets.chomp
    access_token = req.get_access_token(oauth_token: req.token,
                                        oauth_verifier: code)
    Service.add_service(access_token.token, access_token.secret)
  end

  request_token if Service.services.empty?

  FileUtils.mkpath(DAEMON_LOGDIR) unless File.exist?(DAEMON_LOGDIR)
  log = Logger.new(DAEMON_LOGFILE)
  log.info('DAEMON_START')

  onupdate {|svc, msgs|
    msgs.each{|msg|
      log.info(sprintf("[%s:%s] %s", svc.idname,
                       msg.user[:idname], msg[:message].gsub("\n", ' ')))
    }
  }

  loop do
    sleep(3601)
    Service.primary.post(:message => posts.sample)
  end

end
