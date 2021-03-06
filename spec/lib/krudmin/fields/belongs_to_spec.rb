require "spec_helper"
require "#{Dir.pwd}/lib/krudmin/activable_labeler"
require "#{Dir.pwd}/lib/krudmin/fields/base"
require "#{Dir.pwd}/lib/krudmin/fields/associated"
require "#{Dir.pwd}/lib/krudmin/fields/belongs_to"
module Ranger
  class << self
    def all
      [
        OpenStruct.new(name: "Rambo", id: 1),
        OpenStruct.new(name: "Chuck Norris", id: 2),
        OpenStruct.new(name: "Arnold", id: 3)
      ]
    end

    def main
      all.first
    end
  end
end

describe Krudmin::Fields::BelongsTo do
  let(:model) { double(ranger_id: 1, ranger: Ranger.all.first) }
  subject { described_class.new(:ranger_id, model) }

  describe "collection_label_field" do
    context "default" do
      it "returns the default value" do
        expect(subject.collection_label_field).to eq(:label)
      end
    end

    context "with custom option" do
      subject { described_class.new(:ranger_id, model, collection_label_field: :slug) }

      it "returns the value provided to the :collection_label_field option" do
        expect(subject.collection_label_field).to eq(:slug)
      end
    end
  end

  context "inferred relations" do
    describe "selected" do
      it "returns the same result as value" do
        expect(subject.selected).to eq(subject.value)
        expect(subject.selected).to eq(1)
      end
    end

    describe "humanized_value" do
      subject { described_class.new(:ranger_id, model, collection_label_field: :name) }

      it "returns the humanized string from value" do
        expect(subject.humanized_value).not_to be(nil)
        expect(subject.humanized_value).to eq("Rambo")
      end
    end

    describe "selected_association" do
      it "returns the associated model from value" do
        expect(subject.selected_association).not_to be(nil)
        expect(subject.selected_association).to eq(Ranger.all.first)
      end
    end

    describe "associated_options" do
      it "returns all the records by default" do
        expect(subject.associated_options).to eq(Ranger.all)
      end
    end

    describe "associated_options" do
      subject { described_class.new(:ranger_id, model, association_predicate: ->(source) { source.main }) }

      it "executes the main method as the given scope" do
        expect(subject.associated_options).to eq(Ranger.main)
      end
    end

    describe "association_path" do
      subject { described_class.new(:ranger_id, model, association_path: :test_path) }

      it "is extracted from options" do
        expect(subject.association_path).to eq(:test_path)
      end
    end

    describe "link_to_path" do
      subject { described_class.new(:ranger_id, model, association_path: :test_path) }
      let(:view_context) { double }

      it "returns the path of the associated selected model" do
        allow(view_context).to receive(:test_path) do |model|
          expect(model).to eq(Ranger.all.first)
          "/test/show/#{model.id}"
        end

        expect(subject.link_to_path(view_context)).to eq("/test/show/1")
      end
    end
  end
end
