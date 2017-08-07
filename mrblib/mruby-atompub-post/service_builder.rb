# -*- coding: utf-8 -*-

module AtomPubPost
  SERVICE_TYPE_LIVEDOOR = 'livedoor'
  SERVICE_TYPE_BLOGGER = 'blogger'
  SERVICE_TYPE_HATENA = 'hatena'
  class ServiceBuilder
    def ServiceBuilder::get_service(config)
      case config.service.downcase
      when SERVICE_TYPE_LIVEDOOR
        return Service::LiveDoor::new(config)
      when SERVICE_TYPE_BLOGGER
        return Service::Blogger::new(config)
      when SERVICE_TYPE_HATENA
        return Service::Hatena::new(config)
      end
    end
  end
end

