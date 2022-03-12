require 'rails_helper'

RSpec.describe Student, type: :model do
  it 'combina first_name com last_name' do
    turma = SchoolClass.create!(code: 'ABC123')
    estudante = Student.create!(first_name: 'Matheus',
                                last_name: 'Gonçalves',
                                email: 'souzagonc@gmail.com',
                                registration: 123_456,
                                school_class: turma)

    expect(estudante.full_name).to eq('Matheus Gonçalves')
  end

  it 'verifica email unico' do
    turma = SchoolClass.create(code: 'ABC123')
    Student.create(first_name: 'Matheus',
                   last_name: 'Gonçalves',
                   email: 'souzagonc@gmail.com',
                   registration: 123_456,
                   school_class: turma)

    estudante2 = Student.create(first_name: 'João',
                                last_name: 'Silva',
                                email: 'souzagonc@gmail.com',
                                registration: 456_987,
                                school_class: turma)

    expect(estudante2).not_to be_valid
  end

  it 'verifica email unico 2' do
    turma = SchoolClass.create(code: 'ABC123')
    Student.create(first_name: 'Matheus',
                   last_name: 'Gonçalves',
                   email: 'souzagonc@gmail.com',
                   registration: 123_456,
                   school_class: turma)

    expect do
      Student.create!(first_name: 'João',
                      last_name: 'Silva',
                      email: 'souzagonc@gmail.com',
                      registration: 456_987,
                      school_class: turma)
  # end.to raise_error(ActiveRecord::NoTouching)
    end.to raise_error(ActiveRecord::RecordInvalid)
  end
end
