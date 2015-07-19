class MailController < Volt::ModelController
  def receive_mail
    params = {"headers"=>"Received: by mx-016.sjc1.sendgrid.net with SMTP id qUtog9TjVu Wed, 28 Jan 2015 17:12:11 +0000 (GMT)\nReceived: from taurus.uberspace.de (taurus.uberspace.de [95.143.172.102]) by mx-016.sjc1.sendgrid.net (Postfix) with ESMTPS id DA75DA89E56 for <peter@ichtudas.de>; Wed, 28 Jan 2015 17:12:10 +0000 (GMT)\nReceived: (qmail 14566 invoked from network); 28 Jan 2015 17:12:08 -0000\nReceived: from localhost (HELO webmail.taurus.uberspace.de) (127.0.0.1) by localhost with SMTP; 28 Jan 2015 17:12:08 -0000\nMIME-Version: 1.0\nContent-Type: text/plain; charset=US-ASCII; format=flowed\nContent-Transfer-Encoding: 7bit\nDate: Wed, 28 Jan 2015 18:12:08 +0100\nFrom: denny@dennymueller.de\nTo: peter@ichtudas.de\nSubject: Betrefftext\nMessage-ID: <8cf57d75b1d70e5cdcc731543c3cd9c8@dennymueller.de>\nX-Sender: denny@dennymueller.de\nUser-Agent: Roundcube Webmail/1.0.5\n", "dkim"=>"none", "to"=>"peter@ichtudas.de", "from"=>"denny@dennymueller.de", "text"=>"Texttext\n", "sender_ip"=>"95.143.172.102", "envelope"=>"{\"to\":[\"peter@ichtudas.de\"],\"from\":\"denny@dennymueller.de\"}", "attachments"=>"0", "subject"=>"Betrefftext", "charsets"=>"{\"to\":\"UTF-8\",\"subject\":\"UTF-8\",\"from\":\"UTF-8\",\"text\":\"US-ASCII\"}", "SPF"=>"none"}
    Volt.logger.info(params)
    $page.store._mails << params
  end

  private

  def correct_receiver?(mail)
    mail.match(/^[^@]+@ichtudas\.de$/) ? true : false
  end

end