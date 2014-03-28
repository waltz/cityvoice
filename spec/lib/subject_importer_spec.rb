require 'spec_helper'

describe SubjectImporter do
  let(:invalid_header_content) { Rails.root.join('spec/support/fixtures/invalid_subject_headers.csv').read }
  let(:invalid_content) { Rails.root.join('spec/support/fixtures/invalid_subject.csv').read }
  let(:valid_content) { Rails.root.join('spec/support/fixtures/subject.csv').read }

  subject(:importer) { SubjectImporter.new(content) }

  describe '#has_valid_headers?' do
    context 'when the headers are invalid' do
      let(:content) { invalid_header_content }

      it { should_not have_valid_headers }
    end

    context 'when the headers are valid' do
      let(:content) { valid_content }

      it { should have_valid_headers }
    end
  end

  describe '#valid?' do
    context 'when the content is invalid' do
      let(:content) { invalid_content }

      it { should_not be_valid }
    end

    context 'when the headers are invalid' do
      let(:content) { invalid_header_content }

      it { should_not be_valid }
    end

    context 'when the content is valid' do
      let(:content) { valid_content }

      it { should be_valid }
    end
  end

  describe '#errors' do
    context 'when the headers are invalid' do
      let(:content) { invalid_header_content }

      its(:errors) { should include('Name column is missing') }
    end

    context 'when the headers are valid' do
      let(:content) { valid_content }

      its(:errors) { should be_empty }
    end

    context 'when the content is not valid' do
      let(:content) { invalid_content }

      its(:errors) { should include("Line 2: Name can't be blank") }
    end
  end

  describe '#import' do
    context 'with all the required fields to create a subject' do
      let(:content) { valid_content }

      it 'creates a subject' do
        expect { importer.import }.to change { Subject.count }.by(1)
      end

      describe 'the subject' do
        before { importer.import }

        subject { Subject.first }

        its(:name) { should == '1313 Mockingbird Lane' }
        its(:lat) { should == '34.123382' }
        its(:long) { should == '-118.148664' }
      end
    end

    context 'when one of the fields required for a subject is blank' do
      let(:content) { invalid_content }

      it 'does not create a subject' do
        expect { importer.import }.to change(Subject, :count).by(0)
      end
    end
  end

  describe '.import_file' do
    context 'with valid data' do
      it 'creates a subject' do
        expect do
          SubjectImporter.import_file(Rails.root.join('spec/support/fixtures/subject.csv'))
        end.to change(Subject, :count)
      end
    end

    context 'with invalid data' do
      it 'does not create a subject' do
        expect do
          SubjectImporter.import_file(Rails.root.join('spec/support/fixtures/invalid_subject.csv'))
        end.not_to change(Subject, :count)
      end
    end

    context 'with an id header' do
      it 'should not create a subject' do
        SubjectImporter.import_file(Rails.root.join('spec/support/fixtures/subject_with_id.csv'))
        expect { Subject.find('12345') }.not_to raise_error
      end
    end
  end
end
