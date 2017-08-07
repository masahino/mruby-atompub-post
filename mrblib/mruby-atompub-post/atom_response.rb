# -*- coding: utf-8 -*-
#require 'nokogiri'

module AtomPubPost

  class AtomResponse
    attr_accessor :source, :doc

    def initialize(source)
      @source = source
      if @source.respond_to?('force_encoding')
        @source.force_encoding('UTF-8')
      end
      @xml = TinyXML2::XMLDocument.new
      @xml.parse(source)
    end

    # 1つじゃない?
    def uri
      @doc.xpath('//xmlns:link[@rel="alternate"]/@href').to_s
    end

    def collection_uri
      uri_a = []
      workspace = @xml.first_child.next_sibling.first_child
      e = workspace.first_child_element('collection')
      while e != nil
        uri_a.push(e.attribute('href'))
        e = e.next_sibling_element('collection')
      end
      uri_a
    end

    def media_src
      @doc.xpath("//xmlns:content/@src").to_s
    end

    def title
      @doc.xpath("//xmlns:title").text
    end
  end
end
