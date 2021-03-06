require 'spec_helper'

describe NoCms::Carrierwave::Attachment do

  it_behaves_like "model with required attributes", :no_cms_carrierwave_attachment, [:attachment]

  context 'when saving an attachment' do

    let(:attachment) { NoCms::Carrierwave::Attachment.create(attributes_for(:no_cms_carrierwave_attachment)) }

    subject { attachment }

    it "should store it as a carrierwave attachment" do
      expect(subject.attachment).to be_a NoCms::Carrierwave::AttachmentUploader
    end

  end

  context 'when saving an image' do

    let(:attachment) { NoCms::Carrierwave::Attachment.create(attributes_for(:no_cms_carrierwave_image)) }

    subject { attachment }

    it "should create versions" do
      expect(subject.attachment.thumb.url).to_not eq subject.attachment.url
      expect(subject.attachment.thumb.url).to_not be_nil
    end

    it "should not make up versions" do
      expect{subject.attachment.thumb_fake}.to raise_error NoMethodError
    end

  end

  context 'when saving an attachment (not image)' do

    let(:attachment) { NoCms::Carrierwave::Attachment.create(attributes_for(:no_cms_carrierwave_attachment)) }

    subject { attachment }

    it "should not create versions" do
      expect(subject.attachment.thumb.url).to be_nil
    end

  end

  context 'when animated gif versions are disabled' do

    before { NoCms::Carrierwave.disable_animated_gif_versions = true }

    context 'when saving an animated gif' do

      let(:attachment) { NoCms::Carrierwave::Attachment.create(attributes_for(:no_cms_carrierwave_animated_image)) }

      subject { attachment }

      it "should not create versions" do
        expect(subject.attachment.thumb.url).to be_nil
      end

    end

    context 'when saving an static gif' do

      let(:attachment) { NoCms::Carrierwave::Attachment.create(attributes_for(:no_cms_carrierwave_static_gif)) }

      subject { attachment }

      it "should create versions" do
        expect(subject.attachment.thumb.url).to_not eq subject.attachment.url
        expect(subject.attachment.thumb.url).to_not be_nil
      end
    end
  end

  context 'when animated gif versions are disabled' do

    before { NoCms::Carrierwave.disable_animated_gif_versions = false }

    context 'when saving an animated gif' do

      let(:attachment) { NoCms::Carrierwave::Attachment.create(attributes_for(:no_cms_carrierwave_animated_image)) }

      subject { attachment }

      it "should create versions" do
        expect(subject.attachment.thumb.url).to_not eq subject.attachment.url
        expect(subject.attachment.thumb.url).to_not be_nil
      end

    end
  end
end
