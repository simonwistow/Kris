#!/usr/bin/env ruby 

require 'rubygems'
require 'config/config'
require 'models/user'
require 'datetime'

today = DateTime.now


User.all.each do |user|
  next if :io == user.bucket.to_sym                     # io users don't get emails
  next if :si == user.bucket.to_sym && today.wday != 7  # si users don't get emails except on sunday
  Kris::Email.send_email(user.bucket.to_sym, user.email, :user => user)
end