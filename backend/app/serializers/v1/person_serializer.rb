class V1::PersonSerializer < ActiveModel::Serializer
    attributes :person_type, :name

    def person_type
        object.person.person_type
    end

    def name
        object.person.name
    end
end