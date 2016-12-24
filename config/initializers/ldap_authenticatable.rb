require 'net/ldap'
require 'devise/strategies/authenticatable'

module Devise
  module Strategies
    class LdapAuthenticatable < Authenticatable
      def authenticate!
        if params[:user]
          ldap = Net::LDAP.new({
            host: Settings.ldap.host,
            port: Settings.ldap.port,
            base: Settings.ldap.base,
            auth: {
              username: Settings.ldap.auth.username,
              password: Settings.ldap.auth.password,
              method: Settings.ldap.auth.method
            }
          })
          filter = Net::LDAP::Filter.eq(Settings.ldap.uid, uid)
          if ldap.bind_as(filter:filter, password:password)
            user = User.find_or_create_by(uid:uid)
            success!(user)
          else
            return fail(:invalid_login)
          end
        end
      end

      def uid
        params[:user][:uid]
      end

      def password
        params[:user][:password]
      end

    end
  end
end

Warden::Strategies.add(:ldap_authenticatable, Devise::Strategies::LdapAuthenticatable)
