module Kris
  class Email
    def self.send_email(template, to, opts={})
      file = File.join(Kris::ROOT, 'email', "#{template}.erb")
      mail = Mail.new do
        from     Kris::CONFIG['from_email']
        to       to
        subject  opts.delete(:subject)
        body     ERB.new(File.read(file)).result(opts.to_binding)
      end

      if Kris::CONFIG['sendmail']
        mail.deliver!
      else
        puts mail.to_s
      end
    end
  end
end