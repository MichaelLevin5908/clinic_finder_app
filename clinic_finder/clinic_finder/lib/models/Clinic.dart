/*
* Copyright 2021 Amazon.com, Inc. or its affiliates. All Rights Reserved.
*
* Licensed under the Apache License, Version 2.0 (the "License").
* You may not use this file except in compliance with the License.
* A copy of the License is located at
*
*  http://aws.amazon.com/apache2.0
*
* or in the "license" file accompanying this file. This file is distributed
* on an "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either
* express or implied. See the License for the specific language governing
* permissions and limitations under the License.
*/

// NOTE: This file is generated and may not follow lint rules defined in your app
// Generated files can be excluded from analysis in analysis_options.yaml
// For more info, see: https://dart.dev/guides/language/analysis-options#excluding-code-from-analysis

// ignore_for_file: public_member_api_docs, annotate_overrides, dead_code, dead_codepublic_member_api_docs, depend_on_referenced_packages, file_names, library_private_types_in_public_api, no_leading_underscores_for_library_prefixes, no_leading_underscores_for_local_identifiers, non_constant_identifier_names, null_check_on_nullable_type_parameter, override_on_non_overriding_member, prefer_adjacent_string_concatenation, prefer_const_constructors, prefer_if_null_operators, prefer_interpolation_to_compose_strings, slash_for_doc_comments, sort_child_properties_last, unnecessary_const, unnecessary_constructor_name, unnecessary_late, unnecessary_new, unnecessary_null_aware_assignments, unnecessary_nullable_for_final_variable_declarations, unnecessary_string_interpolations, use_build_context_synchronously

import 'ModelProvider.dart';
import 'package:amplify_core/amplify_core.dart' as amplify_core;


/** This is an auto generated class representing the Clinic type in your schema. */
class Clinic extends amplify_core.Model {
  static const classType = const _ClinicModelType();
  final String id;
  final String? _hospitalName;
  final String? _location;
  final String? _address;
  final String? _hours;
  final String? _phoneNumber;
  final amplify_core.TemporalDateTime? _createdAt;
  final amplify_core.TemporalDateTime? _updatedAt;

  @override
  getInstanceType() => classType;
  
  @Deprecated('[getId] is being deprecated in favor of custom primary key feature. Use getter [modelIdentifier] to get model identifier.')
  @override
  String getId() => id;
  
  ClinicModelIdentifier get modelIdentifier {
      return ClinicModelIdentifier(
        id: id
      );
  }
  
  String get hospitalName {
    try {
      return _hospitalName!;
    } catch(e) {
      throw amplify_core.AmplifyCodeGenModelException(
          amplify_core.AmplifyExceptionMessages.codeGenRequiredFieldForceCastExceptionMessage,
          recoverySuggestion:
            amplify_core.AmplifyExceptionMessages.codeGenRequiredFieldForceCastRecoverySuggestion,
          underlyingException: e.toString()
          );
    }
  }
  
  String get location {
    try {
      return _location!;
    } catch(e) {
      throw amplify_core.AmplifyCodeGenModelException(
          amplify_core.AmplifyExceptionMessages.codeGenRequiredFieldForceCastExceptionMessage,
          recoverySuggestion:
            amplify_core.AmplifyExceptionMessages.codeGenRequiredFieldForceCastRecoverySuggestion,
          underlyingException: e.toString()
          );
    }
  }
  
  String get address {
    try {
      return _address!;
    } catch(e) {
      throw amplify_core.AmplifyCodeGenModelException(
          amplify_core.AmplifyExceptionMessages.codeGenRequiredFieldForceCastExceptionMessage,
          recoverySuggestion:
            amplify_core.AmplifyExceptionMessages.codeGenRequiredFieldForceCastRecoverySuggestion,
          underlyingException: e.toString()
          );
    }
  }
  
  String get hours {
    try {
      return _hours!;
    } catch(e) {
      throw amplify_core.AmplifyCodeGenModelException(
          amplify_core.AmplifyExceptionMessages.codeGenRequiredFieldForceCastExceptionMessage,
          recoverySuggestion:
            amplify_core.AmplifyExceptionMessages.codeGenRequiredFieldForceCastRecoverySuggestion,
          underlyingException: e.toString()
          );
    }
  }
  
  String get phoneNumber {
    try {
      return _phoneNumber!;
    } catch(e) {
      throw amplify_core.AmplifyCodeGenModelException(
          amplify_core.AmplifyExceptionMessages.codeGenRequiredFieldForceCastExceptionMessage,
          recoverySuggestion:
            amplify_core.AmplifyExceptionMessages.codeGenRequiredFieldForceCastRecoverySuggestion,
          underlyingException: e.toString()
          );
    }
  }
  
  amplify_core.TemporalDateTime? get createdAt {
    return _createdAt;
  }
  
  amplify_core.TemporalDateTime? get updatedAt {
    return _updatedAt;
  }
  
  const Clinic._internal({required this.id, required hospitalName, required location, required address, required hours, required phoneNumber, createdAt, updatedAt}): _hospitalName = hospitalName, _location = location, _address = address, _hours = hours, _phoneNumber = phoneNumber, _createdAt = createdAt, _updatedAt = updatedAt;
  
  factory Clinic({String? id, required String hospitalName, required String location, required String address, required String hours, required String phoneNumber}) {
    return Clinic._internal(
      id: id == null ? amplify_core.UUID.getUUID() : id,
      hospitalName: hospitalName,
      location: location,
      address: address,
      hours: hours,
      phoneNumber: phoneNumber);
  }
  
  bool equals(Object other) {
    return this == other;
  }
  
  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is Clinic &&
      id == other.id &&
      _hospitalName == other._hospitalName &&
      _location == other._location &&
      _address == other._address &&
      _hours == other._hours &&
      _phoneNumber == other._phoneNumber;
  }
  
  @override
  int get hashCode => toString().hashCode;
  
  @override
  String toString() {
    var buffer = new StringBuffer();
    
    buffer.write("Clinic {");
    buffer.write("id=" + "$id" + ", ");
    buffer.write("hospitalName=" + "$_hospitalName" + ", ");
    buffer.write("location=" + "$_location" + ", ");
    buffer.write("address=" + "$_address" + ", ");
    buffer.write("hours=" + "$_hours" + ", ");
    buffer.write("phoneNumber=" + "$_phoneNumber" + ", ");
    buffer.write("createdAt=" + (_createdAt != null ? _createdAt!.format() : "null") + ", ");
    buffer.write("updatedAt=" + (_updatedAt != null ? _updatedAt!.format() : "null"));
    buffer.write("}");
    
    return buffer.toString();
  }
  
  Clinic copyWith({String? hospitalName, String? location, String? address, String? hours, String? phoneNumber}) {
    return Clinic._internal(
      id: id,
      hospitalName: hospitalName ?? this.hospitalName,
      location: location ?? this.location,
      address: address ?? this.address,
      hours: hours ?? this.hours,
      phoneNumber: phoneNumber ?? this.phoneNumber);
  }
  
  Clinic copyWithModelFieldValues({
    ModelFieldValue<String>? hospitalName,
    ModelFieldValue<String>? location,
    ModelFieldValue<String>? address,
    ModelFieldValue<String>? hours,
    ModelFieldValue<String>? phoneNumber
  }) {
    return Clinic._internal(
      id: id,
      hospitalName: hospitalName == null ? this.hospitalName : hospitalName.value,
      location: location == null ? this.location : location.value,
      address: address == null ? this.address : address.value,
      hours: hours == null ? this.hours : hours.value,
      phoneNumber: phoneNumber == null ? this.phoneNumber : phoneNumber.value
    );
  }
  
  Clinic.fromJson(Map<String, dynamic> json)  
    : id = json['id'],
      _hospitalName = json['hospitalName'],
      _location = json['location'],
      _address = json['address'],
      _hours = json['hours'],
      _phoneNumber = json['phoneNumber'],
      _createdAt = json['createdAt'] != null ? amplify_core.TemporalDateTime.fromString(json['createdAt']) : null,
      _updatedAt = json['updatedAt'] != null ? amplify_core.TemporalDateTime.fromString(json['updatedAt']) : null;
  
  Map<String, dynamic> toJson() => {
    'id': id, 'hospitalName': _hospitalName, 'location': _location, 'address': _address, 'hours': _hours, 'phoneNumber': _phoneNumber, 'createdAt': _createdAt?.format(), 'updatedAt': _updatedAt?.format()
  };
  
  Map<String, Object?> toMap() => {
    'id': id,
    'hospitalName': _hospitalName,
    'location': _location,
    'address': _address,
    'hours': _hours,
    'phoneNumber': _phoneNumber,
    'createdAt': _createdAt,
    'updatedAt': _updatedAt
  };

  static final amplify_core.QueryModelIdentifier<ClinicModelIdentifier> MODEL_IDENTIFIER = amplify_core.QueryModelIdentifier<ClinicModelIdentifier>();
  static final ID = amplify_core.QueryField(fieldName: "id");
  static final HOSPITALNAME = amplify_core.QueryField(fieldName: "hospitalName");
  static final LOCATION = amplify_core.QueryField(fieldName: "location");
  static final ADDRESS = amplify_core.QueryField(fieldName: "address");
  static final HOURS = amplify_core.QueryField(fieldName: "hours");
  static final PHONENUMBER = amplify_core.QueryField(fieldName: "phoneNumber");
  static var schema = amplify_core.Model.defineSchema(define: (amplify_core.ModelSchemaDefinition modelSchemaDefinition) {
    modelSchemaDefinition.name = "Clinic";
    modelSchemaDefinition.pluralName = "Clinics";
    
    modelSchemaDefinition.authRules = [
      amplify_core.AuthRule(
        authStrategy: amplify_core.AuthStrategy.OWNER,
        ownerField: "owner",
        identityClaim: "cognito:username",
        provider: amplify_core.AuthRuleProvider.USERPOOLS,
        operations: const [
          amplify_core.ModelOperation.CREATE,
          amplify_core.ModelOperation.UPDATE,
          amplify_core.ModelOperation.DELETE,
          amplify_core.ModelOperation.READ
        ])
    ];
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.id());
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: Clinic.HOSPITALNAME,
      isRequired: true,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: Clinic.LOCATION,
      isRequired: true,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: Clinic.ADDRESS,
      isRequired: true,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: Clinic.HOURS,
      isRequired: true,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: Clinic.PHONENUMBER,
      isRequired: true,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.nonQueryField(
      fieldName: 'createdAt',
      isRequired: false,
      isReadOnly: true,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.dateTime)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.nonQueryField(
      fieldName: 'updatedAt',
      isRequired: false,
      isReadOnly: true,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.dateTime)
    ));
  });
}

class _ClinicModelType extends amplify_core.ModelType<Clinic> {
  const _ClinicModelType();
  
  @override
  Clinic fromJson(Map<String, dynamic> jsonData) {
    return Clinic.fromJson(jsonData);
  }
  
  @override
  String modelName() {
    return 'Clinic';
  }
}

/**
 * This is an auto generated class representing the model identifier
 * of [Clinic] in your schema.
 */
class ClinicModelIdentifier implements amplify_core.ModelIdentifier<Clinic> {
  final String id;

  /** Create an instance of ClinicModelIdentifier using [id] the primary key. */
  const ClinicModelIdentifier({
    required this.id});
  
  @override
  Map<String, dynamic> serializeAsMap() => (<String, dynamic>{
    'id': id
  });
  
  @override
  List<Map<String, dynamic>> serializeAsList() => serializeAsMap()
    .entries
    .map((entry) => (<String, dynamic>{ entry.key: entry.value }))
    .toList();
  
  @override
  String serializeAsString() => serializeAsMap().values.join('#');
  
  @override
  String toString() => 'ClinicModelIdentifier(id: $id)';
  
  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    
    return other is ClinicModelIdentifier &&
      id == other.id;
  }
  
  @override
  int get hashCode =>
    id.hashCode;
}