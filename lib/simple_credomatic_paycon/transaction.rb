require 'time'
require 'yaml'
require 'net/https'
require 'uri'
require 'digest/md5'

module SimpleCredomaticPaycon
  class Transaction

    attr_reader :orderid, :amount, :ccnumber, :ccexp, :cvv

    def initialize(params)
      @orderid = params[:orderid]
      @amount = params[:amount]
      @ccnumber = params[:ccnumber]
      @ccexp = params[:ccexp]
      @cvv = params[:cvv]
      @username = params[:username]
      @key = params[:key]
      @key_id = params[:key_id]
    end

    def process
      time = Time.now.to_i
      hash = Digest::MD5.hexdigest("#{@orderid}|#{@amount}|#{time}|#{@key}")

      url = URI.parse("https://paycom.credomatic.com/PayComBackEndWeb/common/requestPaycomService.go")
      req = Net::HTTP::Post.new(url.path)
      req.set_form_data({
          'username' => @username, 
          'type' => 'auth',
          'key_id' => @key_id,
          'hash' => hash,
          'time' => time,
          'redirect' => 'http://localhost',
          'ccnumber' => @ccnumber,
          'ccexp' => @ccexp,
          'amount' => sprintf("%.2f",@amount),
          'orderid' => @orderid,
          'cvv' => @cvv
          })

      sock = Net::HTTP.new(url.host, url.port)
      sock.use_ssl = true
      res = sock.start {|http| http.request(req) }      

      case res
      #  Response to 2xx y 3xx
      when Net::HTTPSuccess, Net::HTTPRedirection

        respuesta = res.fetch('location')
        a_response = URI.decode_www_form(respuesta)
        h_response = Hash[a_response]

        puts "Dump de la respuesta en YAML"
        puts YAML::dump(res)

        puts "Parametros devuelvos en location convertido en Hash"
        puts h_response


        return h_response
      # response to 4xx Error
      when Net::HTTPClientError
        puts "Error 4xx D:"

        # { code: res.code  }
        {}
      else
        # TODO: 
        puts 'Huston - hubo un problema problema :/'        
        puts res.value

        # Return a Hash with error
        # { code: res.code  }
        {}
      end    

    end

  end
end