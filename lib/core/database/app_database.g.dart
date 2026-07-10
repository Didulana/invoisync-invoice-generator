// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_database.dart';

// ignore_for_file: type=lint
class $BusinessProfileTable extends BusinessProfile
    with TableInfo<$BusinessProfileTable, BusinessProfileData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $BusinessProfileTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    clientDefault: () => const Uuid().v4(),
  );
  static const VerificationMeta _updatedAtMeta = const VerificationMeta(
    'updatedAt',
  );
  @override
  late final GeneratedColumn<DateTime> updatedAt = GeneratedColumn<DateTime>(
    'updated_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
    defaultValue: currentDateAndTime,
  );
  static const VerificationMeta _isSyncedMeta = const VerificationMeta(
    'isSynced',
  );
  @override
  late final GeneratedColumn<bool> isSynced = GeneratedColumn<bool>(
    'is_synced',
    aliasedName,
    false,
    type: DriftSqlType.bool,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'CHECK ("is_synced" IN (0, 1))',
    ),
    defaultValue: const Constant(false),
  );
  static const VerificationMeta _isDeletedMeta = const VerificationMeta(
    'isDeleted',
  );
  @override
  late final GeneratedColumn<bool> isDeleted = GeneratedColumn<bool>(
    'is_deleted',
    aliasedName,
    false,
    type: DriftSqlType.bool,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'CHECK ("is_deleted" IN (0, 1))',
    ),
    defaultValue: const Constant(false),
  );
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
    'name',
    aliasedName,
    false,
    additionalChecks: GeneratedColumn.checkTextLength(
      minTextLength: 1,
      maxTextLength: 100,
    ),
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _emailMeta = const VerificationMeta('email');
  @override
  late final GeneratedColumn<String> email = GeneratedColumn<String>(
    'email',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _phoneMeta = const VerificationMeta('phone');
  @override
  late final GeneratedColumn<String> phone = GeneratedColumn<String>(
    'phone',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _addressMeta = const VerificationMeta(
    'address',
  );
  @override
  late final GeneratedColumn<String> address = GeneratedColumn<String>(
    'address',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _taxNumberMeta = const VerificationMeta(
    'taxNumber',
  );
  @override
  late final GeneratedColumn<String> taxNumber = GeneratedColumn<String>(
    'tax_number',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _logoUriMeta = const VerificationMeta(
    'logoUri',
  );
  @override
  late final GeneratedColumn<String> logoUri = GeneratedColumn<String>(
    'logo_uri',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    updatedAt,
    isSynced,
    isDeleted,
    name,
    email,
    phone,
    address,
    taxNumber,
    logoUri,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'business_profile';
  @override
  VerificationContext validateIntegrity(
    Insertable<BusinessProfileData> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('updated_at')) {
      context.handle(
        _updatedAtMeta,
        updatedAt.isAcceptableOrUnknown(data['updated_at']!, _updatedAtMeta),
      );
    }
    if (data.containsKey('is_synced')) {
      context.handle(
        _isSyncedMeta,
        isSynced.isAcceptableOrUnknown(data['is_synced']!, _isSyncedMeta),
      );
    }
    if (data.containsKey('is_deleted')) {
      context.handle(
        _isDeletedMeta,
        isDeleted.isAcceptableOrUnknown(data['is_deleted']!, _isDeletedMeta),
      );
    }
    if (data.containsKey('name')) {
      context.handle(
        _nameMeta,
        name.isAcceptableOrUnknown(data['name']!, _nameMeta),
      );
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('email')) {
      context.handle(
        _emailMeta,
        email.isAcceptableOrUnknown(data['email']!, _emailMeta),
      );
    }
    if (data.containsKey('phone')) {
      context.handle(
        _phoneMeta,
        phone.isAcceptableOrUnknown(data['phone']!, _phoneMeta),
      );
    }
    if (data.containsKey('address')) {
      context.handle(
        _addressMeta,
        address.isAcceptableOrUnknown(data['address']!, _addressMeta),
      );
    }
    if (data.containsKey('tax_number')) {
      context.handle(
        _taxNumberMeta,
        taxNumber.isAcceptableOrUnknown(data['tax_number']!, _taxNumberMeta),
      );
    }
    if (data.containsKey('logo_uri')) {
      context.handle(
        _logoUriMeta,
        logoUri.isAcceptableOrUnknown(data['logo_uri']!, _logoUriMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  BusinessProfileData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return BusinessProfileData(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}id'],
      )!,
      updatedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}updated_at'],
      )!,
      isSynced: attachedDatabase.typeMapping.read(
        DriftSqlType.bool,
        data['${effectivePrefix}is_synced'],
      )!,
      isDeleted: attachedDatabase.typeMapping.read(
        DriftSqlType.bool,
        data['${effectivePrefix}is_deleted'],
      )!,
      name: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}name'],
      )!,
      email: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}email'],
      ),
      phone: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}phone'],
      ),
      address: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}address'],
      ),
      taxNumber: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}tax_number'],
      ),
      logoUri: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}logo_uri'],
      ),
    );
  }

  @override
  $BusinessProfileTable createAlias(String alias) {
    return $BusinessProfileTable(attachedDatabase, alias);
  }
}

class BusinessProfileData extends DataClass
    implements Insertable<BusinessProfileData> {
  final String id;
  final DateTime updatedAt;
  final bool isSynced;
  final bool isDeleted;
  final String name;
  final String? email;
  final String? phone;
  final String? address;
  final String? taxNumber;
  final String? logoUri;
  const BusinessProfileData({
    required this.id,
    required this.updatedAt,
    required this.isSynced,
    required this.isDeleted,
    required this.name,
    this.email,
    this.phone,
    this.address,
    this.taxNumber,
    this.logoUri,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['updated_at'] = Variable<DateTime>(updatedAt);
    map['is_synced'] = Variable<bool>(isSynced);
    map['is_deleted'] = Variable<bool>(isDeleted);
    map['name'] = Variable<String>(name);
    if (!nullToAbsent || email != null) {
      map['email'] = Variable<String>(email);
    }
    if (!nullToAbsent || phone != null) {
      map['phone'] = Variable<String>(phone);
    }
    if (!nullToAbsent || address != null) {
      map['address'] = Variable<String>(address);
    }
    if (!nullToAbsent || taxNumber != null) {
      map['tax_number'] = Variable<String>(taxNumber);
    }
    if (!nullToAbsent || logoUri != null) {
      map['logo_uri'] = Variable<String>(logoUri);
    }
    return map;
  }

  BusinessProfileCompanion toCompanion(bool nullToAbsent) {
    return BusinessProfileCompanion(
      id: Value(id),
      updatedAt: Value(updatedAt),
      isSynced: Value(isSynced),
      isDeleted: Value(isDeleted),
      name: Value(name),
      email: email == null && nullToAbsent
          ? const Value.absent()
          : Value(email),
      phone: phone == null && nullToAbsent
          ? const Value.absent()
          : Value(phone),
      address: address == null && nullToAbsent
          ? const Value.absent()
          : Value(address),
      taxNumber: taxNumber == null && nullToAbsent
          ? const Value.absent()
          : Value(taxNumber),
      logoUri: logoUri == null && nullToAbsent
          ? const Value.absent()
          : Value(logoUri),
    );
  }

  factory BusinessProfileData.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return BusinessProfileData(
      id: serializer.fromJson<String>(json['id']),
      updatedAt: serializer.fromJson<DateTime>(json['updatedAt']),
      isSynced: serializer.fromJson<bool>(json['isSynced']),
      isDeleted: serializer.fromJson<bool>(json['isDeleted']),
      name: serializer.fromJson<String>(json['name']),
      email: serializer.fromJson<String?>(json['email']),
      phone: serializer.fromJson<String?>(json['phone']),
      address: serializer.fromJson<String?>(json['address']),
      taxNumber: serializer.fromJson<String?>(json['taxNumber']),
      logoUri: serializer.fromJson<String?>(json['logoUri']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'updatedAt': serializer.toJson<DateTime>(updatedAt),
      'isSynced': serializer.toJson<bool>(isSynced),
      'isDeleted': serializer.toJson<bool>(isDeleted),
      'name': serializer.toJson<String>(name),
      'email': serializer.toJson<String?>(email),
      'phone': serializer.toJson<String?>(phone),
      'address': serializer.toJson<String?>(address),
      'taxNumber': serializer.toJson<String?>(taxNumber),
      'logoUri': serializer.toJson<String?>(logoUri),
    };
  }

  BusinessProfileData copyWith({
    String? id,
    DateTime? updatedAt,
    bool? isSynced,
    bool? isDeleted,
    String? name,
    Value<String?> email = const Value.absent(),
    Value<String?> phone = const Value.absent(),
    Value<String?> address = const Value.absent(),
    Value<String?> taxNumber = const Value.absent(),
    Value<String?> logoUri = const Value.absent(),
  }) => BusinessProfileData(
    id: id ?? this.id,
    updatedAt: updatedAt ?? this.updatedAt,
    isSynced: isSynced ?? this.isSynced,
    isDeleted: isDeleted ?? this.isDeleted,
    name: name ?? this.name,
    email: email.present ? email.value : this.email,
    phone: phone.present ? phone.value : this.phone,
    address: address.present ? address.value : this.address,
    taxNumber: taxNumber.present ? taxNumber.value : this.taxNumber,
    logoUri: logoUri.present ? logoUri.value : this.logoUri,
  );
  BusinessProfileData copyWithCompanion(BusinessProfileCompanion data) {
    return BusinessProfileData(
      id: data.id.present ? data.id.value : this.id,
      updatedAt: data.updatedAt.present ? data.updatedAt.value : this.updatedAt,
      isSynced: data.isSynced.present ? data.isSynced.value : this.isSynced,
      isDeleted: data.isDeleted.present ? data.isDeleted.value : this.isDeleted,
      name: data.name.present ? data.name.value : this.name,
      email: data.email.present ? data.email.value : this.email,
      phone: data.phone.present ? data.phone.value : this.phone,
      address: data.address.present ? data.address.value : this.address,
      taxNumber: data.taxNumber.present ? data.taxNumber.value : this.taxNumber,
      logoUri: data.logoUri.present ? data.logoUri.value : this.logoUri,
    );
  }

  @override
  String toString() {
    return (StringBuffer('BusinessProfileData(')
          ..write('id: $id, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('isSynced: $isSynced, ')
          ..write('isDeleted: $isDeleted, ')
          ..write('name: $name, ')
          ..write('email: $email, ')
          ..write('phone: $phone, ')
          ..write('address: $address, ')
          ..write('taxNumber: $taxNumber, ')
          ..write('logoUri: $logoUri')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    updatedAt,
    isSynced,
    isDeleted,
    name,
    email,
    phone,
    address,
    taxNumber,
    logoUri,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is BusinessProfileData &&
          other.id == this.id &&
          other.updatedAt == this.updatedAt &&
          other.isSynced == this.isSynced &&
          other.isDeleted == this.isDeleted &&
          other.name == this.name &&
          other.email == this.email &&
          other.phone == this.phone &&
          other.address == this.address &&
          other.taxNumber == this.taxNumber &&
          other.logoUri == this.logoUri);
}

class BusinessProfileCompanion extends UpdateCompanion<BusinessProfileData> {
  final Value<String> id;
  final Value<DateTime> updatedAt;
  final Value<bool> isSynced;
  final Value<bool> isDeleted;
  final Value<String> name;
  final Value<String?> email;
  final Value<String?> phone;
  final Value<String?> address;
  final Value<String?> taxNumber;
  final Value<String?> logoUri;
  final Value<int> rowid;
  const BusinessProfileCompanion({
    this.id = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.isSynced = const Value.absent(),
    this.isDeleted = const Value.absent(),
    this.name = const Value.absent(),
    this.email = const Value.absent(),
    this.phone = const Value.absent(),
    this.address = const Value.absent(),
    this.taxNumber = const Value.absent(),
    this.logoUri = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  BusinessProfileCompanion.insert({
    this.id = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.isSynced = const Value.absent(),
    this.isDeleted = const Value.absent(),
    required String name,
    this.email = const Value.absent(),
    this.phone = const Value.absent(),
    this.address = const Value.absent(),
    this.taxNumber = const Value.absent(),
    this.logoUri = const Value.absent(),
    this.rowid = const Value.absent(),
  }) : name = Value(name);
  static Insertable<BusinessProfileData> custom({
    Expression<String>? id,
    Expression<DateTime>? updatedAt,
    Expression<bool>? isSynced,
    Expression<bool>? isDeleted,
    Expression<String>? name,
    Expression<String>? email,
    Expression<String>? phone,
    Expression<String>? address,
    Expression<String>? taxNumber,
    Expression<String>? logoUri,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (updatedAt != null) 'updated_at': updatedAt,
      if (isSynced != null) 'is_synced': isSynced,
      if (isDeleted != null) 'is_deleted': isDeleted,
      if (name != null) 'name': name,
      if (email != null) 'email': email,
      if (phone != null) 'phone': phone,
      if (address != null) 'address': address,
      if (taxNumber != null) 'tax_number': taxNumber,
      if (logoUri != null) 'logo_uri': logoUri,
      if (rowid != null) 'rowid': rowid,
    });
  }

  BusinessProfileCompanion copyWith({
    Value<String>? id,
    Value<DateTime>? updatedAt,
    Value<bool>? isSynced,
    Value<bool>? isDeleted,
    Value<String>? name,
    Value<String?>? email,
    Value<String?>? phone,
    Value<String?>? address,
    Value<String?>? taxNumber,
    Value<String?>? logoUri,
    Value<int>? rowid,
  }) {
    return BusinessProfileCompanion(
      id: id ?? this.id,
      updatedAt: updatedAt ?? this.updatedAt,
      isSynced: isSynced ?? this.isSynced,
      isDeleted: isDeleted ?? this.isDeleted,
      name: name ?? this.name,
      email: email ?? this.email,
      phone: phone ?? this.phone,
      address: address ?? this.address,
      taxNumber: taxNumber ?? this.taxNumber,
      logoUri: logoUri ?? this.logoUri,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (updatedAt.present) {
      map['updated_at'] = Variable<DateTime>(updatedAt.value);
    }
    if (isSynced.present) {
      map['is_synced'] = Variable<bool>(isSynced.value);
    }
    if (isDeleted.present) {
      map['is_deleted'] = Variable<bool>(isDeleted.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (email.present) {
      map['email'] = Variable<String>(email.value);
    }
    if (phone.present) {
      map['phone'] = Variable<String>(phone.value);
    }
    if (address.present) {
      map['address'] = Variable<String>(address.value);
    }
    if (taxNumber.present) {
      map['tax_number'] = Variable<String>(taxNumber.value);
    }
    if (logoUri.present) {
      map['logo_uri'] = Variable<String>(logoUri.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('BusinessProfileCompanion(')
          ..write('id: $id, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('isSynced: $isSynced, ')
          ..write('isDeleted: $isDeleted, ')
          ..write('name: $name, ')
          ..write('email: $email, ')
          ..write('phone: $phone, ')
          ..write('address: $address, ')
          ..write('taxNumber: $taxNumber, ')
          ..write('logoUri: $logoUri, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $ClientsTable extends Clients with TableInfo<$ClientsTable, Client> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $ClientsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    clientDefault: () => const Uuid().v4(),
  );
  static const VerificationMeta _updatedAtMeta = const VerificationMeta(
    'updatedAt',
  );
  @override
  late final GeneratedColumn<DateTime> updatedAt = GeneratedColumn<DateTime>(
    'updated_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
    defaultValue: currentDateAndTime,
  );
  static const VerificationMeta _isSyncedMeta = const VerificationMeta(
    'isSynced',
  );
  @override
  late final GeneratedColumn<bool> isSynced = GeneratedColumn<bool>(
    'is_synced',
    aliasedName,
    false,
    type: DriftSqlType.bool,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'CHECK ("is_synced" IN (0, 1))',
    ),
    defaultValue: const Constant(false),
  );
  static const VerificationMeta _isDeletedMeta = const VerificationMeta(
    'isDeleted',
  );
  @override
  late final GeneratedColumn<bool> isDeleted = GeneratedColumn<bool>(
    'is_deleted',
    aliasedName,
    false,
    type: DriftSqlType.bool,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'CHECK ("is_deleted" IN (0, 1))',
    ),
    defaultValue: const Constant(false),
  );
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
    'name',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _emailMeta = const VerificationMeta('email');
  @override
  late final GeneratedColumn<String> email = GeneratedColumn<String>(
    'email',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _phoneMeta = const VerificationMeta('phone');
  @override
  late final GeneratedColumn<String> phone = GeneratedColumn<String>(
    'phone',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _billingAddressMeta = const VerificationMeta(
    'billingAddress',
  );
  @override
  late final GeneratedColumn<String> billingAddress = GeneratedColumn<String>(
    'billing_address',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _notesMeta = const VerificationMeta('notes');
  @override
  late final GeneratedColumn<String> notes = GeneratedColumn<String>(
    'notes',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    updatedAt,
    isSynced,
    isDeleted,
    name,
    email,
    phone,
    billingAddress,
    notes,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'clients';
  @override
  VerificationContext validateIntegrity(
    Insertable<Client> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('updated_at')) {
      context.handle(
        _updatedAtMeta,
        updatedAt.isAcceptableOrUnknown(data['updated_at']!, _updatedAtMeta),
      );
    }
    if (data.containsKey('is_synced')) {
      context.handle(
        _isSyncedMeta,
        isSynced.isAcceptableOrUnknown(data['is_synced']!, _isSyncedMeta),
      );
    }
    if (data.containsKey('is_deleted')) {
      context.handle(
        _isDeletedMeta,
        isDeleted.isAcceptableOrUnknown(data['is_deleted']!, _isDeletedMeta),
      );
    }
    if (data.containsKey('name')) {
      context.handle(
        _nameMeta,
        name.isAcceptableOrUnknown(data['name']!, _nameMeta),
      );
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('email')) {
      context.handle(
        _emailMeta,
        email.isAcceptableOrUnknown(data['email']!, _emailMeta),
      );
    }
    if (data.containsKey('phone')) {
      context.handle(
        _phoneMeta,
        phone.isAcceptableOrUnknown(data['phone']!, _phoneMeta),
      );
    }
    if (data.containsKey('billing_address')) {
      context.handle(
        _billingAddressMeta,
        billingAddress.isAcceptableOrUnknown(
          data['billing_address']!,
          _billingAddressMeta,
        ),
      );
    }
    if (data.containsKey('notes')) {
      context.handle(
        _notesMeta,
        notes.isAcceptableOrUnknown(data['notes']!, _notesMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Client map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Client(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}id'],
      )!,
      updatedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}updated_at'],
      )!,
      isSynced: attachedDatabase.typeMapping.read(
        DriftSqlType.bool,
        data['${effectivePrefix}is_synced'],
      )!,
      isDeleted: attachedDatabase.typeMapping.read(
        DriftSqlType.bool,
        data['${effectivePrefix}is_deleted'],
      )!,
      name: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}name'],
      )!,
      email: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}email'],
      ),
      phone: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}phone'],
      ),
      billingAddress: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}billing_address'],
      ),
      notes: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}notes'],
      ),
    );
  }

  @override
  $ClientsTable createAlias(String alias) {
    return $ClientsTable(attachedDatabase, alias);
  }
}

class Client extends DataClass implements Insertable<Client> {
  final String id;
  final DateTime updatedAt;
  final bool isSynced;
  final bool isDeleted;
  final String name;
  final String? email;
  final String? phone;
  final String? billingAddress;
  final String? notes;
  const Client({
    required this.id,
    required this.updatedAt,
    required this.isSynced,
    required this.isDeleted,
    required this.name,
    this.email,
    this.phone,
    this.billingAddress,
    this.notes,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['updated_at'] = Variable<DateTime>(updatedAt);
    map['is_synced'] = Variable<bool>(isSynced);
    map['is_deleted'] = Variable<bool>(isDeleted);
    map['name'] = Variable<String>(name);
    if (!nullToAbsent || email != null) {
      map['email'] = Variable<String>(email);
    }
    if (!nullToAbsent || phone != null) {
      map['phone'] = Variable<String>(phone);
    }
    if (!nullToAbsent || billingAddress != null) {
      map['billing_address'] = Variable<String>(billingAddress);
    }
    if (!nullToAbsent || notes != null) {
      map['notes'] = Variable<String>(notes);
    }
    return map;
  }

  ClientsCompanion toCompanion(bool nullToAbsent) {
    return ClientsCompanion(
      id: Value(id),
      updatedAt: Value(updatedAt),
      isSynced: Value(isSynced),
      isDeleted: Value(isDeleted),
      name: Value(name),
      email: email == null && nullToAbsent
          ? const Value.absent()
          : Value(email),
      phone: phone == null && nullToAbsent
          ? const Value.absent()
          : Value(phone),
      billingAddress: billingAddress == null && nullToAbsent
          ? const Value.absent()
          : Value(billingAddress),
      notes: notes == null && nullToAbsent
          ? const Value.absent()
          : Value(notes),
    );
  }

  factory Client.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Client(
      id: serializer.fromJson<String>(json['id']),
      updatedAt: serializer.fromJson<DateTime>(json['updatedAt']),
      isSynced: serializer.fromJson<bool>(json['isSynced']),
      isDeleted: serializer.fromJson<bool>(json['isDeleted']),
      name: serializer.fromJson<String>(json['name']),
      email: serializer.fromJson<String?>(json['email']),
      phone: serializer.fromJson<String?>(json['phone']),
      billingAddress: serializer.fromJson<String?>(json['billingAddress']),
      notes: serializer.fromJson<String?>(json['notes']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'updatedAt': serializer.toJson<DateTime>(updatedAt),
      'isSynced': serializer.toJson<bool>(isSynced),
      'isDeleted': serializer.toJson<bool>(isDeleted),
      'name': serializer.toJson<String>(name),
      'email': serializer.toJson<String?>(email),
      'phone': serializer.toJson<String?>(phone),
      'billingAddress': serializer.toJson<String?>(billingAddress),
      'notes': serializer.toJson<String?>(notes),
    };
  }

  Client copyWith({
    String? id,
    DateTime? updatedAt,
    bool? isSynced,
    bool? isDeleted,
    String? name,
    Value<String?> email = const Value.absent(),
    Value<String?> phone = const Value.absent(),
    Value<String?> billingAddress = const Value.absent(),
    Value<String?> notes = const Value.absent(),
  }) => Client(
    id: id ?? this.id,
    updatedAt: updatedAt ?? this.updatedAt,
    isSynced: isSynced ?? this.isSynced,
    isDeleted: isDeleted ?? this.isDeleted,
    name: name ?? this.name,
    email: email.present ? email.value : this.email,
    phone: phone.present ? phone.value : this.phone,
    billingAddress: billingAddress.present
        ? billingAddress.value
        : this.billingAddress,
    notes: notes.present ? notes.value : this.notes,
  );
  Client copyWithCompanion(ClientsCompanion data) {
    return Client(
      id: data.id.present ? data.id.value : this.id,
      updatedAt: data.updatedAt.present ? data.updatedAt.value : this.updatedAt,
      isSynced: data.isSynced.present ? data.isSynced.value : this.isSynced,
      isDeleted: data.isDeleted.present ? data.isDeleted.value : this.isDeleted,
      name: data.name.present ? data.name.value : this.name,
      email: data.email.present ? data.email.value : this.email,
      phone: data.phone.present ? data.phone.value : this.phone,
      billingAddress: data.billingAddress.present
          ? data.billingAddress.value
          : this.billingAddress,
      notes: data.notes.present ? data.notes.value : this.notes,
    );
  }

  @override
  String toString() {
    return (StringBuffer('Client(')
          ..write('id: $id, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('isSynced: $isSynced, ')
          ..write('isDeleted: $isDeleted, ')
          ..write('name: $name, ')
          ..write('email: $email, ')
          ..write('phone: $phone, ')
          ..write('billingAddress: $billingAddress, ')
          ..write('notes: $notes')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    updatedAt,
    isSynced,
    isDeleted,
    name,
    email,
    phone,
    billingAddress,
    notes,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Client &&
          other.id == this.id &&
          other.updatedAt == this.updatedAt &&
          other.isSynced == this.isSynced &&
          other.isDeleted == this.isDeleted &&
          other.name == this.name &&
          other.email == this.email &&
          other.phone == this.phone &&
          other.billingAddress == this.billingAddress &&
          other.notes == this.notes);
}

class ClientsCompanion extends UpdateCompanion<Client> {
  final Value<String> id;
  final Value<DateTime> updatedAt;
  final Value<bool> isSynced;
  final Value<bool> isDeleted;
  final Value<String> name;
  final Value<String?> email;
  final Value<String?> phone;
  final Value<String?> billingAddress;
  final Value<String?> notes;
  final Value<int> rowid;
  const ClientsCompanion({
    this.id = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.isSynced = const Value.absent(),
    this.isDeleted = const Value.absent(),
    this.name = const Value.absent(),
    this.email = const Value.absent(),
    this.phone = const Value.absent(),
    this.billingAddress = const Value.absent(),
    this.notes = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  ClientsCompanion.insert({
    this.id = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.isSynced = const Value.absent(),
    this.isDeleted = const Value.absent(),
    required String name,
    this.email = const Value.absent(),
    this.phone = const Value.absent(),
    this.billingAddress = const Value.absent(),
    this.notes = const Value.absent(),
    this.rowid = const Value.absent(),
  }) : name = Value(name);
  static Insertable<Client> custom({
    Expression<String>? id,
    Expression<DateTime>? updatedAt,
    Expression<bool>? isSynced,
    Expression<bool>? isDeleted,
    Expression<String>? name,
    Expression<String>? email,
    Expression<String>? phone,
    Expression<String>? billingAddress,
    Expression<String>? notes,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (updatedAt != null) 'updated_at': updatedAt,
      if (isSynced != null) 'is_synced': isSynced,
      if (isDeleted != null) 'is_deleted': isDeleted,
      if (name != null) 'name': name,
      if (email != null) 'email': email,
      if (phone != null) 'phone': phone,
      if (billingAddress != null) 'billing_address': billingAddress,
      if (notes != null) 'notes': notes,
      if (rowid != null) 'rowid': rowid,
    });
  }

  ClientsCompanion copyWith({
    Value<String>? id,
    Value<DateTime>? updatedAt,
    Value<bool>? isSynced,
    Value<bool>? isDeleted,
    Value<String>? name,
    Value<String?>? email,
    Value<String?>? phone,
    Value<String?>? billingAddress,
    Value<String?>? notes,
    Value<int>? rowid,
  }) {
    return ClientsCompanion(
      id: id ?? this.id,
      updatedAt: updatedAt ?? this.updatedAt,
      isSynced: isSynced ?? this.isSynced,
      isDeleted: isDeleted ?? this.isDeleted,
      name: name ?? this.name,
      email: email ?? this.email,
      phone: phone ?? this.phone,
      billingAddress: billingAddress ?? this.billingAddress,
      notes: notes ?? this.notes,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (updatedAt.present) {
      map['updated_at'] = Variable<DateTime>(updatedAt.value);
    }
    if (isSynced.present) {
      map['is_synced'] = Variable<bool>(isSynced.value);
    }
    if (isDeleted.present) {
      map['is_deleted'] = Variable<bool>(isDeleted.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (email.present) {
      map['email'] = Variable<String>(email.value);
    }
    if (phone.present) {
      map['phone'] = Variable<String>(phone.value);
    }
    if (billingAddress.present) {
      map['billing_address'] = Variable<String>(billingAddress.value);
    }
    if (notes.present) {
      map['notes'] = Variable<String>(notes.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('ClientsCompanion(')
          ..write('id: $id, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('isSynced: $isSynced, ')
          ..write('isDeleted: $isDeleted, ')
          ..write('name: $name, ')
          ..write('email: $email, ')
          ..write('phone: $phone, ')
          ..write('billingAddress: $billingAddress, ')
          ..write('notes: $notes, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $ItemsTable extends Items with TableInfo<$ItemsTable, Item> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $ItemsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    clientDefault: () => const Uuid().v4(),
  );
  static const VerificationMeta _updatedAtMeta = const VerificationMeta(
    'updatedAt',
  );
  @override
  late final GeneratedColumn<DateTime> updatedAt = GeneratedColumn<DateTime>(
    'updated_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
    defaultValue: currentDateAndTime,
  );
  static const VerificationMeta _isSyncedMeta = const VerificationMeta(
    'isSynced',
  );
  @override
  late final GeneratedColumn<bool> isSynced = GeneratedColumn<bool>(
    'is_synced',
    aliasedName,
    false,
    type: DriftSqlType.bool,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'CHECK ("is_synced" IN (0, 1))',
    ),
    defaultValue: const Constant(false),
  );
  static const VerificationMeta _isDeletedMeta = const VerificationMeta(
    'isDeleted',
  );
  @override
  late final GeneratedColumn<bool> isDeleted = GeneratedColumn<bool>(
    'is_deleted',
    aliasedName,
    false,
    type: DriftSqlType.bool,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'CHECK ("is_deleted" IN (0, 1))',
    ),
    defaultValue: const Constant(false),
  );
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
    'name',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _descriptionMeta = const VerificationMeta(
    'description',
  );
  @override
  late final GeneratedColumn<String> description = GeneratedColumn<String>(
    'description',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _unitPriceMeta = const VerificationMeta(
    'unitPrice',
  );
  @override
  late final GeneratedColumn<double> unitPrice = GeneratedColumn<double>(
    'unit_price',
    aliasedName,
    false,
    type: DriftSqlType.double,
    requiredDuringInsert: false,
    defaultValue: const Constant(0.0),
  );
  static const VerificationMeta _unitTypeMeta = const VerificationMeta(
    'unitType',
  );
  @override
  late final GeneratedColumn<String> unitType = GeneratedColumn<String>(
    'unit_type',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    defaultValue: const Constant('Item'),
  );
  static const VerificationMeta _taxableMeta = const VerificationMeta(
    'taxable',
  );
  @override
  late final GeneratedColumn<bool> taxable = GeneratedColumn<bool>(
    'taxable',
    aliasedName,
    false,
    type: DriftSqlType.bool,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'CHECK ("taxable" IN (0, 1))',
    ),
    defaultValue: const Constant(true),
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    updatedAt,
    isSynced,
    isDeleted,
    name,
    description,
    unitPrice,
    unitType,
    taxable,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'items';
  @override
  VerificationContext validateIntegrity(
    Insertable<Item> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('updated_at')) {
      context.handle(
        _updatedAtMeta,
        updatedAt.isAcceptableOrUnknown(data['updated_at']!, _updatedAtMeta),
      );
    }
    if (data.containsKey('is_synced')) {
      context.handle(
        _isSyncedMeta,
        isSynced.isAcceptableOrUnknown(data['is_synced']!, _isSyncedMeta),
      );
    }
    if (data.containsKey('is_deleted')) {
      context.handle(
        _isDeletedMeta,
        isDeleted.isAcceptableOrUnknown(data['is_deleted']!, _isDeletedMeta),
      );
    }
    if (data.containsKey('name')) {
      context.handle(
        _nameMeta,
        name.isAcceptableOrUnknown(data['name']!, _nameMeta),
      );
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('description')) {
      context.handle(
        _descriptionMeta,
        description.isAcceptableOrUnknown(
          data['description']!,
          _descriptionMeta,
        ),
      );
    }
    if (data.containsKey('unit_price')) {
      context.handle(
        _unitPriceMeta,
        unitPrice.isAcceptableOrUnknown(data['unit_price']!, _unitPriceMeta),
      );
    }
    if (data.containsKey('unit_type')) {
      context.handle(
        _unitTypeMeta,
        unitType.isAcceptableOrUnknown(data['unit_type']!, _unitTypeMeta),
      );
    }
    if (data.containsKey('taxable')) {
      context.handle(
        _taxableMeta,
        taxable.isAcceptableOrUnknown(data['taxable']!, _taxableMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Item map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Item(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}id'],
      )!,
      updatedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}updated_at'],
      )!,
      isSynced: attachedDatabase.typeMapping.read(
        DriftSqlType.bool,
        data['${effectivePrefix}is_synced'],
      )!,
      isDeleted: attachedDatabase.typeMapping.read(
        DriftSqlType.bool,
        data['${effectivePrefix}is_deleted'],
      )!,
      name: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}name'],
      )!,
      description: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}description'],
      ),
      unitPrice: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}unit_price'],
      )!,
      unitType: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}unit_type'],
      )!,
      taxable: attachedDatabase.typeMapping.read(
        DriftSqlType.bool,
        data['${effectivePrefix}taxable'],
      )!,
    );
  }

  @override
  $ItemsTable createAlias(String alias) {
    return $ItemsTable(attachedDatabase, alias);
  }
}

class Item extends DataClass implements Insertable<Item> {
  final String id;
  final DateTime updatedAt;
  final bool isSynced;
  final bool isDeleted;
  final String name;
  final String? description;
  final double unitPrice;
  final String unitType;
  final bool taxable;
  const Item({
    required this.id,
    required this.updatedAt,
    required this.isSynced,
    required this.isDeleted,
    required this.name,
    this.description,
    required this.unitPrice,
    required this.unitType,
    required this.taxable,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['updated_at'] = Variable<DateTime>(updatedAt);
    map['is_synced'] = Variable<bool>(isSynced);
    map['is_deleted'] = Variable<bool>(isDeleted);
    map['name'] = Variable<String>(name);
    if (!nullToAbsent || description != null) {
      map['description'] = Variable<String>(description);
    }
    map['unit_price'] = Variable<double>(unitPrice);
    map['unit_type'] = Variable<String>(unitType);
    map['taxable'] = Variable<bool>(taxable);
    return map;
  }

  ItemsCompanion toCompanion(bool nullToAbsent) {
    return ItemsCompanion(
      id: Value(id),
      updatedAt: Value(updatedAt),
      isSynced: Value(isSynced),
      isDeleted: Value(isDeleted),
      name: Value(name),
      description: description == null && nullToAbsent
          ? const Value.absent()
          : Value(description),
      unitPrice: Value(unitPrice),
      unitType: Value(unitType),
      taxable: Value(taxable),
    );
  }

  factory Item.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Item(
      id: serializer.fromJson<String>(json['id']),
      updatedAt: serializer.fromJson<DateTime>(json['updatedAt']),
      isSynced: serializer.fromJson<bool>(json['isSynced']),
      isDeleted: serializer.fromJson<bool>(json['isDeleted']),
      name: serializer.fromJson<String>(json['name']),
      description: serializer.fromJson<String?>(json['description']),
      unitPrice: serializer.fromJson<double>(json['unitPrice']),
      unitType: serializer.fromJson<String>(json['unitType']),
      taxable: serializer.fromJson<bool>(json['taxable']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'updatedAt': serializer.toJson<DateTime>(updatedAt),
      'isSynced': serializer.toJson<bool>(isSynced),
      'isDeleted': serializer.toJson<bool>(isDeleted),
      'name': serializer.toJson<String>(name),
      'description': serializer.toJson<String?>(description),
      'unitPrice': serializer.toJson<double>(unitPrice),
      'unitType': serializer.toJson<String>(unitType),
      'taxable': serializer.toJson<bool>(taxable),
    };
  }

  Item copyWith({
    String? id,
    DateTime? updatedAt,
    bool? isSynced,
    bool? isDeleted,
    String? name,
    Value<String?> description = const Value.absent(),
    double? unitPrice,
    String? unitType,
    bool? taxable,
  }) => Item(
    id: id ?? this.id,
    updatedAt: updatedAt ?? this.updatedAt,
    isSynced: isSynced ?? this.isSynced,
    isDeleted: isDeleted ?? this.isDeleted,
    name: name ?? this.name,
    description: description.present ? description.value : this.description,
    unitPrice: unitPrice ?? this.unitPrice,
    unitType: unitType ?? this.unitType,
    taxable: taxable ?? this.taxable,
  );
  Item copyWithCompanion(ItemsCompanion data) {
    return Item(
      id: data.id.present ? data.id.value : this.id,
      updatedAt: data.updatedAt.present ? data.updatedAt.value : this.updatedAt,
      isSynced: data.isSynced.present ? data.isSynced.value : this.isSynced,
      isDeleted: data.isDeleted.present ? data.isDeleted.value : this.isDeleted,
      name: data.name.present ? data.name.value : this.name,
      description: data.description.present
          ? data.description.value
          : this.description,
      unitPrice: data.unitPrice.present ? data.unitPrice.value : this.unitPrice,
      unitType: data.unitType.present ? data.unitType.value : this.unitType,
      taxable: data.taxable.present ? data.taxable.value : this.taxable,
    );
  }

  @override
  String toString() {
    return (StringBuffer('Item(')
          ..write('id: $id, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('isSynced: $isSynced, ')
          ..write('isDeleted: $isDeleted, ')
          ..write('name: $name, ')
          ..write('description: $description, ')
          ..write('unitPrice: $unitPrice, ')
          ..write('unitType: $unitType, ')
          ..write('taxable: $taxable')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    updatedAt,
    isSynced,
    isDeleted,
    name,
    description,
    unitPrice,
    unitType,
    taxable,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Item &&
          other.id == this.id &&
          other.updatedAt == this.updatedAt &&
          other.isSynced == this.isSynced &&
          other.isDeleted == this.isDeleted &&
          other.name == this.name &&
          other.description == this.description &&
          other.unitPrice == this.unitPrice &&
          other.unitType == this.unitType &&
          other.taxable == this.taxable);
}

class ItemsCompanion extends UpdateCompanion<Item> {
  final Value<String> id;
  final Value<DateTime> updatedAt;
  final Value<bool> isSynced;
  final Value<bool> isDeleted;
  final Value<String> name;
  final Value<String?> description;
  final Value<double> unitPrice;
  final Value<String> unitType;
  final Value<bool> taxable;
  final Value<int> rowid;
  const ItemsCompanion({
    this.id = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.isSynced = const Value.absent(),
    this.isDeleted = const Value.absent(),
    this.name = const Value.absent(),
    this.description = const Value.absent(),
    this.unitPrice = const Value.absent(),
    this.unitType = const Value.absent(),
    this.taxable = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  ItemsCompanion.insert({
    this.id = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.isSynced = const Value.absent(),
    this.isDeleted = const Value.absent(),
    required String name,
    this.description = const Value.absent(),
    this.unitPrice = const Value.absent(),
    this.unitType = const Value.absent(),
    this.taxable = const Value.absent(),
    this.rowid = const Value.absent(),
  }) : name = Value(name);
  static Insertable<Item> custom({
    Expression<String>? id,
    Expression<DateTime>? updatedAt,
    Expression<bool>? isSynced,
    Expression<bool>? isDeleted,
    Expression<String>? name,
    Expression<String>? description,
    Expression<double>? unitPrice,
    Expression<String>? unitType,
    Expression<bool>? taxable,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (updatedAt != null) 'updated_at': updatedAt,
      if (isSynced != null) 'is_synced': isSynced,
      if (isDeleted != null) 'is_deleted': isDeleted,
      if (name != null) 'name': name,
      if (description != null) 'description': description,
      if (unitPrice != null) 'unit_price': unitPrice,
      if (unitType != null) 'unit_type': unitType,
      if (taxable != null) 'taxable': taxable,
      if (rowid != null) 'rowid': rowid,
    });
  }

  ItemsCompanion copyWith({
    Value<String>? id,
    Value<DateTime>? updatedAt,
    Value<bool>? isSynced,
    Value<bool>? isDeleted,
    Value<String>? name,
    Value<String?>? description,
    Value<double>? unitPrice,
    Value<String>? unitType,
    Value<bool>? taxable,
    Value<int>? rowid,
  }) {
    return ItemsCompanion(
      id: id ?? this.id,
      updatedAt: updatedAt ?? this.updatedAt,
      isSynced: isSynced ?? this.isSynced,
      isDeleted: isDeleted ?? this.isDeleted,
      name: name ?? this.name,
      description: description ?? this.description,
      unitPrice: unitPrice ?? this.unitPrice,
      unitType: unitType ?? this.unitType,
      taxable: taxable ?? this.taxable,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (updatedAt.present) {
      map['updated_at'] = Variable<DateTime>(updatedAt.value);
    }
    if (isSynced.present) {
      map['is_synced'] = Variable<bool>(isSynced.value);
    }
    if (isDeleted.present) {
      map['is_deleted'] = Variable<bool>(isDeleted.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (description.present) {
      map['description'] = Variable<String>(description.value);
    }
    if (unitPrice.present) {
      map['unit_price'] = Variable<double>(unitPrice.value);
    }
    if (unitType.present) {
      map['unit_type'] = Variable<String>(unitType.value);
    }
    if (taxable.present) {
      map['taxable'] = Variable<bool>(taxable.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('ItemsCompanion(')
          ..write('id: $id, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('isSynced: $isSynced, ')
          ..write('isDeleted: $isDeleted, ')
          ..write('name: $name, ')
          ..write('description: $description, ')
          ..write('unitPrice: $unitPrice, ')
          ..write('unitType: $unitType, ')
          ..write('taxable: $taxable, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $InvoicesTable extends Invoices with TableInfo<$InvoicesTable, Invoice> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $InvoicesTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    clientDefault: () => const Uuid().v4(),
  );
  static const VerificationMeta _updatedAtMeta = const VerificationMeta(
    'updatedAt',
  );
  @override
  late final GeneratedColumn<DateTime> updatedAt = GeneratedColumn<DateTime>(
    'updated_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
    defaultValue: currentDateAndTime,
  );
  static const VerificationMeta _isSyncedMeta = const VerificationMeta(
    'isSynced',
  );
  @override
  late final GeneratedColumn<bool> isSynced = GeneratedColumn<bool>(
    'is_synced',
    aliasedName,
    false,
    type: DriftSqlType.bool,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'CHECK ("is_synced" IN (0, 1))',
    ),
    defaultValue: const Constant(false),
  );
  static const VerificationMeta _isDeletedMeta = const VerificationMeta(
    'isDeleted',
  );
  @override
  late final GeneratedColumn<bool> isDeleted = GeneratedColumn<bool>(
    'is_deleted',
    aliasedName,
    false,
    type: DriftSqlType.bool,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'CHECK ("is_deleted" IN (0, 1))',
    ),
    defaultValue: const Constant(false),
  );
  static const VerificationMeta _invoiceNumberMeta = const VerificationMeta(
    'invoiceNumber',
  );
  @override
  late final GeneratedColumn<String> invoiceNumber = GeneratedColumn<String>(
    'invoice_number',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _clientIdMeta = const VerificationMeta(
    'clientId',
  );
  @override
  late final GeneratedColumn<String> clientId = GeneratedColumn<String>(
    'client_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES clients (id)',
    ),
  );
  static const VerificationMeta _issueDateMeta = const VerificationMeta(
    'issueDate',
  );
  @override
  late final GeneratedColumn<DateTime> issueDate = GeneratedColumn<DateTime>(
    'issue_date',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _dueDateMeta = const VerificationMeta(
    'dueDate',
  );
  @override
  late final GeneratedColumn<DateTime> dueDate = GeneratedColumn<DateTime>(
    'due_date',
    aliasedName,
    true,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _statusMeta = const VerificationMeta('status');
  @override
  late final GeneratedColumn<String> status = GeneratedColumn<String>(
    'status',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    defaultValue: const Constant('draft'),
  );
  static const VerificationMeta _subtotalMeta = const VerificationMeta(
    'subtotal',
  );
  @override
  late final GeneratedColumn<double> subtotal = GeneratedColumn<double>(
    'subtotal',
    aliasedName,
    false,
    type: DriftSqlType.double,
    requiredDuringInsert: false,
    defaultValue: const Constant(0.0),
  );
  static const VerificationMeta _taxTotalMeta = const VerificationMeta(
    'taxTotal',
  );
  @override
  late final GeneratedColumn<double> taxTotal = GeneratedColumn<double>(
    'tax_total',
    aliasedName,
    false,
    type: DriftSqlType.double,
    requiredDuringInsert: false,
    defaultValue: const Constant(0.0),
  );
  static const VerificationMeta _discountTotalMeta = const VerificationMeta(
    'discountTotal',
  );
  @override
  late final GeneratedColumn<double> discountTotal = GeneratedColumn<double>(
    'discount_total',
    aliasedName,
    false,
    type: DriftSqlType.double,
    requiredDuringInsert: false,
    defaultValue: const Constant(0.0),
  );
  static const VerificationMeta _grandTotalMeta = const VerificationMeta(
    'grandTotal',
  );
  @override
  late final GeneratedColumn<double> grandTotal = GeneratedColumn<double>(
    'grand_total',
    aliasedName,
    false,
    type: DriftSqlType.double,
    requiredDuringInsert: false,
    defaultValue: const Constant(0.0),
  );
  static const VerificationMeta _termsMeta = const VerificationMeta('terms');
  @override
  late final GeneratedColumn<String> terms = GeneratedColumn<String>(
    'terms',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    updatedAt,
    isSynced,
    isDeleted,
    invoiceNumber,
    clientId,
    issueDate,
    dueDate,
    status,
    subtotal,
    taxTotal,
    discountTotal,
    grandTotal,
    terms,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'invoices';
  @override
  VerificationContext validateIntegrity(
    Insertable<Invoice> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('updated_at')) {
      context.handle(
        _updatedAtMeta,
        updatedAt.isAcceptableOrUnknown(data['updated_at']!, _updatedAtMeta),
      );
    }
    if (data.containsKey('is_synced')) {
      context.handle(
        _isSyncedMeta,
        isSynced.isAcceptableOrUnknown(data['is_synced']!, _isSyncedMeta),
      );
    }
    if (data.containsKey('is_deleted')) {
      context.handle(
        _isDeletedMeta,
        isDeleted.isAcceptableOrUnknown(data['is_deleted']!, _isDeletedMeta),
      );
    }
    if (data.containsKey('invoice_number')) {
      context.handle(
        _invoiceNumberMeta,
        invoiceNumber.isAcceptableOrUnknown(
          data['invoice_number']!,
          _invoiceNumberMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_invoiceNumberMeta);
    }
    if (data.containsKey('client_id')) {
      context.handle(
        _clientIdMeta,
        clientId.isAcceptableOrUnknown(data['client_id']!, _clientIdMeta),
      );
    } else if (isInserting) {
      context.missing(_clientIdMeta);
    }
    if (data.containsKey('issue_date')) {
      context.handle(
        _issueDateMeta,
        issueDate.isAcceptableOrUnknown(data['issue_date']!, _issueDateMeta),
      );
    } else if (isInserting) {
      context.missing(_issueDateMeta);
    }
    if (data.containsKey('due_date')) {
      context.handle(
        _dueDateMeta,
        dueDate.isAcceptableOrUnknown(data['due_date']!, _dueDateMeta),
      );
    }
    if (data.containsKey('status')) {
      context.handle(
        _statusMeta,
        status.isAcceptableOrUnknown(data['status']!, _statusMeta),
      );
    }
    if (data.containsKey('subtotal')) {
      context.handle(
        _subtotalMeta,
        subtotal.isAcceptableOrUnknown(data['subtotal']!, _subtotalMeta),
      );
    }
    if (data.containsKey('tax_total')) {
      context.handle(
        _taxTotalMeta,
        taxTotal.isAcceptableOrUnknown(data['tax_total']!, _taxTotalMeta),
      );
    }
    if (data.containsKey('discount_total')) {
      context.handle(
        _discountTotalMeta,
        discountTotal.isAcceptableOrUnknown(
          data['discount_total']!,
          _discountTotalMeta,
        ),
      );
    }
    if (data.containsKey('grand_total')) {
      context.handle(
        _grandTotalMeta,
        grandTotal.isAcceptableOrUnknown(data['grand_total']!, _grandTotalMeta),
      );
    }
    if (data.containsKey('terms')) {
      context.handle(
        _termsMeta,
        terms.isAcceptableOrUnknown(data['terms']!, _termsMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Invoice map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Invoice(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}id'],
      )!,
      updatedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}updated_at'],
      )!,
      isSynced: attachedDatabase.typeMapping.read(
        DriftSqlType.bool,
        data['${effectivePrefix}is_synced'],
      )!,
      isDeleted: attachedDatabase.typeMapping.read(
        DriftSqlType.bool,
        data['${effectivePrefix}is_deleted'],
      )!,
      invoiceNumber: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}invoice_number'],
      )!,
      clientId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}client_id'],
      )!,
      issueDate: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}issue_date'],
      )!,
      dueDate: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}due_date'],
      ),
      status: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}status'],
      )!,
      subtotal: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}subtotal'],
      )!,
      taxTotal: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}tax_total'],
      )!,
      discountTotal: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}discount_total'],
      )!,
      grandTotal: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}grand_total'],
      )!,
      terms: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}terms'],
      ),
    );
  }

  @override
  $InvoicesTable createAlias(String alias) {
    return $InvoicesTable(attachedDatabase, alias);
  }
}

class Invoice extends DataClass implements Insertable<Invoice> {
  final String id;
  final DateTime updatedAt;
  final bool isSynced;
  final bool isDeleted;
  final String invoiceNumber;
  final String clientId;
  final DateTime issueDate;
  final DateTime? dueDate;
  final String status;
  final double subtotal;
  final double taxTotal;
  final double discountTotal;
  final double grandTotal;
  final String? terms;
  const Invoice({
    required this.id,
    required this.updatedAt,
    required this.isSynced,
    required this.isDeleted,
    required this.invoiceNumber,
    required this.clientId,
    required this.issueDate,
    this.dueDate,
    required this.status,
    required this.subtotal,
    required this.taxTotal,
    required this.discountTotal,
    required this.grandTotal,
    this.terms,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['updated_at'] = Variable<DateTime>(updatedAt);
    map['is_synced'] = Variable<bool>(isSynced);
    map['is_deleted'] = Variable<bool>(isDeleted);
    map['invoice_number'] = Variable<String>(invoiceNumber);
    map['client_id'] = Variable<String>(clientId);
    map['issue_date'] = Variable<DateTime>(issueDate);
    if (!nullToAbsent || dueDate != null) {
      map['due_date'] = Variable<DateTime>(dueDate);
    }
    map['status'] = Variable<String>(status);
    map['subtotal'] = Variable<double>(subtotal);
    map['tax_total'] = Variable<double>(taxTotal);
    map['discount_total'] = Variable<double>(discountTotal);
    map['grand_total'] = Variable<double>(grandTotal);
    if (!nullToAbsent || terms != null) {
      map['terms'] = Variable<String>(terms);
    }
    return map;
  }

  InvoicesCompanion toCompanion(bool nullToAbsent) {
    return InvoicesCompanion(
      id: Value(id),
      updatedAt: Value(updatedAt),
      isSynced: Value(isSynced),
      isDeleted: Value(isDeleted),
      invoiceNumber: Value(invoiceNumber),
      clientId: Value(clientId),
      issueDate: Value(issueDate),
      dueDate: dueDate == null && nullToAbsent
          ? const Value.absent()
          : Value(dueDate),
      status: Value(status),
      subtotal: Value(subtotal),
      taxTotal: Value(taxTotal),
      discountTotal: Value(discountTotal),
      grandTotal: Value(grandTotal),
      terms: terms == null && nullToAbsent
          ? const Value.absent()
          : Value(terms),
    );
  }

  factory Invoice.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Invoice(
      id: serializer.fromJson<String>(json['id']),
      updatedAt: serializer.fromJson<DateTime>(json['updatedAt']),
      isSynced: serializer.fromJson<bool>(json['isSynced']),
      isDeleted: serializer.fromJson<bool>(json['isDeleted']),
      invoiceNumber: serializer.fromJson<String>(json['invoiceNumber']),
      clientId: serializer.fromJson<String>(json['clientId']),
      issueDate: serializer.fromJson<DateTime>(json['issueDate']),
      dueDate: serializer.fromJson<DateTime?>(json['dueDate']),
      status: serializer.fromJson<String>(json['status']),
      subtotal: serializer.fromJson<double>(json['subtotal']),
      taxTotal: serializer.fromJson<double>(json['taxTotal']),
      discountTotal: serializer.fromJson<double>(json['discountTotal']),
      grandTotal: serializer.fromJson<double>(json['grandTotal']),
      terms: serializer.fromJson<String?>(json['terms']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'updatedAt': serializer.toJson<DateTime>(updatedAt),
      'isSynced': serializer.toJson<bool>(isSynced),
      'isDeleted': serializer.toJson<bool>(isDeleted),
      'invoiceNumber': serializer.toJson<String>(invoiceNumber),
      'clientId': serializer.toJson<String>(clientId),
      'issueDate': serializer.toJson<DateTime>(issueDate),
      'dueDate': serializer.toJson<DateTime?>(dueDate),
      'status': serializer.toJson<String>(status),
      'subtotal': serializer.toJson<double>(subtotal),
      'taxTotal': serializer.toJson<double>(taxTotal),
      'discountTotal': serializer.toJson<double>(discountTotal),
      'grandTotal': serializer.toJson<double>(grandTotal),
      'terms': serializer.toJson<String?>(terms),
    };
  }

  Invoice copyWith({
    String? id,
    DateTime? updatedAt,
    bool? isSynced,
    bool? isDeleted,
    String? invoiceNumber,
    String? clientId,
    DateTime? issueDate,
    Value<DateTime?> dueDate = const Value.absent(),
    String? status,
    double? subtotal,
    double? taxTotal,
    double? discountTotal,
    double? grandTotal,
    Value<String?> terms = const Value.absent(),
  }) => Invoice(
    id: id ?? this.id,
    updatedAt: updatedAt ?? this.updatedAt,
    isSynced: isSynced ?? this.isSynced,
    isDeleted: isDeleted ?? this.isDeleted,
    invoiceNumber: invoiceNumber ?? this.invoiceNumber,
    clientId: clientId ?? this.clientId,
    issueDate: issueDate ?? this.issueDate,
    dueDate: dueDate.present ? dueDate.value : this.dueDate,
    status: status ?? this.status,
    subtotal: subtotal ?? this.subtotal,
    taxTotal: taxTotal ?? this.taxTotal,
    discountTotal: discountTotal ?? this.discountTotal,
    grandTotal: grandTotal ?? this.grandTotal,
    terms: terms.present ? terms.value : this.terms,
  );
  Invoice copyWithCompanion(InvoicesCompanion data) {
    return Invoice(
      id: data.id.present ? data.id.value : this.id,
      updatedAt: data.updatedAt.present ? data.updatedAt.value : this.updatedAt,
      isSynced: data.isSynced.present ? data.isSynced.value : this.isSynced,
      isDeleted: data.isDeleted.present ? data.isDeleted.value : this.isDeleted,
      invoiceNumber: data.invoiceNumber.present
          ? data.invoiceNumber.value
          : this.invoiceNumber,
      clientId: data.clientId.present ? data.clientId.value : this.clientId,
      issueDate: data.issueDate.present ? data.issueDate.value : this.issueDate,
      dueDate: data.dueDate.present ? data.dueDate.value : this.dueDate,
      status: data.status.present ? data.status.value : this.status,
      subtotal: data.subtotal.present ? data.subtotal.value : this.subtotal,
      taxTotal: data.taxTotal.present ? data.taxTotal.value : this.taxTotal,
      discountTotal: data.discountTotal.present
          ? data.discountTotal.value
          : this.discountTotal,
      grandTotal: data.grandTotal.present
          ? data.grandTotal.value
          : this.grandTotal,
      terms: data.terms.present ? data.terms.value : this.terms,
    );
  }

  @override
  String toString() {
    return (StringBuffer('Invoice(')
          ..write('id: $id, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('isSynced: $isSynced, ')
          ..write('isDeleted: $isDeleted, ')
          ..write('invoiceNumber: $invoiceNumber, ')
          ..write('clientId: $clientId, ')
          ..write('issueDate: $issueDate, ')
          ..write('dueDate: $dueDate, ')
          ..write('status: $status, ')
          ..write('subtotal: $subtotal, ')
          ..write('taxTotal: $taxTotal, ')
          ..write('discountTotal: $discountTotal, ')
          ..write('grandTotal: $grandTotal, ')
          ..write('terms: $terms')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    updatedAt,
    isSynced,
    isDeleted,
    invoiceNumber,
    clientId,
    issueDate,
    dueDate,
    status,
    subtotal,
    taxTotal,
    discountTotal,
    grandTotal,
    terms,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Invoice &&
          other.id == this.id &&
          other.updatedAt == this.updatedAt &&
          other.isSynced == this.isSynced &&
          other.isDeleted == this.isDeleted &&
          other.invoiceNumber == this.invoiceNumber &&
          other.clientId == this.clientId &&
          other.issueDate == this.issueDate &&
          other.dueDate == this.dueDate &&
          other.status == this.status &&
          other.subtotal == this.subtotal &&
          other.taxTotal == this.taxTotal &&
          other.discountTotal == this.discountTotal &&
          other.grandTotal == this.grandTotal &&
          other.terms == this.terms);
}

class InvoicesCompanion extends UpdateCompanion<Invoice> {
  final Value<String> id;
  final Value<DateTime> updatedAt;
  final Value<bool> isSynced;
  final Value<bool> isDeleted;
  final Value<String> invoiceNumber;
  final Value<String> clientId;
  final Value<DateTime> issueDate;
  final Value<DateTime?> dueDate;
  final Value<String> status;
  final Value<double> subtotal;
  final Value<double> taxTotal;
  final Value<double> discountTotal;
  final Value<double> grandTotal;
  final Value<String?> terms;
  final Value<int> rowid;
  const InvoicesCompanion({
    this.id = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.isSynced = const Value.absent(),
    this.isDeleted = const Value.absent(),
    this.invoiceNumber = const Value.absent(),
    this.clientId = const Value.absent(),
    this.issueDate = const Value.absent(),
    this.dueDate = const Value.absent(),
    this.status = const Value.absent(),
    this.subtotal = const Value.absent(),
    this.taxTotal = const Value.absent(),
    this.discountTotal = const Value.absent(),
    this.grandTotal = const Value.absent(),
    this.terms = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  InvoicesCompanion.insert({
    this.id = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.isSynced = const Value.absent(),
    this.isDeleted = const Value.absent(),
    required String invoiceNumber,
    required String clientId,
    required DateTime issueDate,
    this.dueDate = const Value.absent(),
    this.status = const Value.absent(),
    this.subtotal = const Value.absent(),
    this.taxTotal = const Value.absent(),
    this.discountTotal = const Value.absent(),
    this.grandTotal = const Value.absent(),
    this.terms = const Value.absent(),
    this.rowid = const Value.absent(),
  }) : invoiceNumber = Value(invoiceNumber),
       clientId = Value(clientId),
       issueDate = Value(issueDate);
  static Insertable<Invoice> custom({
    Expression<String>? id,
    Expression<DateTime>? updatedAt,
    Expression<bool>? isSynced,
    Expression<bool>? isDeleted,
    Expression<String>? invoiceNumber,
    Expression<String>? clientId,
    Expression<DateTime>? issueDate,
    Expression<DateTime>? dueDate,
    Expression<String>? status,
    Expression<double>? subtotal,
    Expression<double>? taxTotal,
    Expression<double>? discountTotal,
    Expression<double>? grandTotal,
    Expression<String>? terms,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (updatedAt != null) 'updated_at': updatedAt,
      if (isSynced != null) 'is_synced': isSynced,
      if (isDeleted != null) 'is_deleted': isDeleted,
      if (invoiceNumber != null) 'invoice_number': invoiceNumber,
      if (clientId != null) 'client_id': clientId,
      if (issueDate != null) 'issue_date': issueDate,
      if (dueDate != null) 'due_date': dueDate,
      if (status != null) 'status': status,
      if (subtotal != null) 'subtotal': subtotal,
      if (taxTotal != null) 'tax_total': taxTotal,
      if (discountTotal != null) 'discount_total': discountTotal,
      if (grandTotal != null) 'grand_total': grandTotal,
      if (terms != null) 'terms': terms,
      if (rowid != null) 'rowid': rowid,
    });
  }

  InvoicesCompanion copyWith({
    Value<String>? id,
    Value<DateTime>? updatedAt,
    Value<bool>? isSynced,
    Value<bool>? isDeleted,
    Value<String>? invoiceNumber,
    Value<String>? clientId,
    Value<DateTime>? issueDate,
    Value<DateTime?>? dueDate,
    Value<String>? status,
    Value<double>? subtotal,
    Value<double>? taxTotal,
    Value<double>? discountTotal,
    Value<double>? grandTotal,
    Value<String?>? terms,
    Value<int>? rowid,
  }) {
    return InvoicesCompanion(
      id: id ?? this.id,
      updatedAt: updatedAt ?? this.updatedAt,
      isSynced: isSynced ?? this.isSynced,
      isDeleted: isDeleted ?? this.isDeleted,
      invoiceNumber: invoiceNumber ?? this.invoiceNumber,
      clientId: clientId ?? this.clientId,
      issueDate: issueDate ?? this.issueDate,
      dueDate: dueDate ?? this.dueDate,
      status: status ?? this.status,
      subtotal: subtotal ?? this.subtotal,
      taxTotal: taxTotal ?? this.taxTotal,
      discountTotal: discountTotal ?? this.discountTotal,
      grandTotal: grandTotal ?? this.grandTotal,
      terms: terms ?? this.terms,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (updatedAt.present) {
      map['updated_at'] = Variable<DateTime>(updatedAt.value);
    }
    if (isSynced.present) {
      map['is_synced'] = Variable<bool>(isSynced.value);
    }
    if (isDeleted.present) {
      map['is_deleted'] = Variable<bool>(isDeleted.value);
    }
    if (invoiceNumber.present) {
      map['invoice_number'] = Variable<String>(invoiceNumber.value);
    }
    if (clientId.present) {
      map['client_id'] = Variable<String>(clientId.value);
    }
    if (issueDate.present) {
      map['issue_date'] = Variable<DateTime>(issueDate.value);
    }
    if (dueDate.present) {
      map['due_date'] = Variable<DateTime>(dueDate.value);
    }
    if (status.present) {
      map['status'] = Variable<String>(status.value);
    }
    if (subtotal.present) {
      map['subtotal'] = Variable<double>(subtotal.value);
    }
    if (taxTotal.present) {
      map['tax_total'] = Variable<double>(taxTotal.value);
    }
    if (discountTotal.present) {
      map['discount_total'] = Variable<double>(discountTotal.value);
    }
    if (grandTotal.present) {
      map['grand_total'] = Variable<double>(grandTotal.value);
    }
    if (terms.present) {
      map['terms'] = Variable<String>(terms.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('InvoicesCompanion(')
          ..write('id: $id, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('isSynced: $isSynced, ')
          ..write('isDeleted: $isDeleted, ')
          ..write('invoiceNumber: $invoiceNumber, ')
          ..write('clientId: $clientId, ')
          ..write('issueDate: $issueDate, ')
          ..write('dueDate: $dueDate, ')
          ..write('status: $status, ')
          ..write('subtotal: $subtotal, ')
          ..write('taxTotal: $taxTotal, ')
          ..write('discountTotal: $discountTotal, ')
          ..write('grandTotal: $grandTotal, ')
          ..write('terms: $terms, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $InvoiceLineItemsTable extends InvoiceLineItems
    with TableInfo<$InvoiceLineItemsTable, InvoiceLineItem> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $InvoiceLineItemsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    clientDefault: () => const Uuid().v4(),
  );
  static const VerificationMeta _updatedAtMeta = const VerificationMeta(
    'updatedAt',
  );
  @override
  late final GeneratedColumn<DateTime> updatedAt = GeneratedColumn<DateTime>(
    'updated_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
    defaultValue: currentDateAndTime,
  );
  static const VerificationMeta _isSyncedMeta = const VerificationMeta(
    'isSynced',
  );
  @override
  late final GeneratedColumn<bool> isSynced = GeneratedColumn<bool>(
    'is_synced',
    aliasedName,
    false,
    type: DriftSqlType.bool,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'CHECK ("is_synced" IN (0, 1))',
    ),
    defaultValue: const Constant(false),
  );
  static const VerificationMeta _isDeletedMeta = const VerificationMeta(
    'isDeleted',
  );
  @override
  late final GeneratedColumn<bool> isDeleted = GeneratedColumn<bool>(
    'is_deleted',
    aliasedName,
    false,
    type: DriftSqlType.bool,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'CHECK ("is_deleted" IN (0, 1))',
    ),
    defaultValue: const Constant(false),
  );
  static const VerificationMeta _invoiceIdMeta = const VerificationMeta(
    'invoiceId',
  );
  @override
  late final GeneratedColumn<String> invoiceId = GeneratedColumn<String>(
    'invoice_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES invoices (id)',
    ),
  );
  static const VerificationMeta _itemIdMeta = const VerificationMeta('itemId');
  @override
  late final GeneratedColumn<String> itemId = GeneratedColumn<String>(
    'item_id',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
    'name',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _descriptionMeta = const VerificationMeta(
    'description',
  );
  @override
  late final GeneratedColumn<String> description = GeneratedColumn<String>(
    'description',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _quantityMeta = const VerificationMeta(
    'quantity',
  );
  @override
  late final GeneratedColumn<double> quantity = GeneratedColumn<double>(
    'quantity',
    aliasedName,
    false,
    type: DriftSqlType.double,
    requiredDuringInsert: false,
    defaultValue: const Constant(1.0),
  );
  static const VerificationMeta _unitPriceMeta = const VerificationMeta(
    'unitPrice',
  );
  @override
  late final GeneratedColumn<double> unitPrice = GeneratedColumn<double>(
    'unit_price',
    aliasedName,
    false,
    type: DriftSqlType.double,
    requiredDuringInsert: false,
    defaultValue: const Constant(0.0),
  );
  static const VerificationMeta _lineTotalMeta = const VerificationMeta(
    'lineTotal',
  );
  @override
  late final GeneratedColumn<double> lineTotal = GeneratedColumn<double>(
    'line_total',
    aliasedName,
    false,
    type: DriftSqlType.double,
    requiredDuringInsert: false,
    defaultValue: const Constant(0.0),
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    updatedAt,
    isSynced,
    isDeleted,
    invoiceId,
    itemId,
    name,
    description,
    quantity,
    unitPrice,
    lineTotal,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'invoice_line_items';
  @override
  VerificationContext validateIntegrity(
    Insertable<InvoiceLineItem> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('updated_at')) {
      context.handle(
        _updatedAtMeta,
        updatedAt.isAcceptableOrUnknown(data['updated_at']!, _updatedAtMeta),
      );
    }
    if (data.containsKey('is_synced')) {
      context.handle(
        _isSyncedMeta,
        isSynced.isAcceptableOrUnknown(data['is_synced']!, _isSyncedMeta),
      );
    }
    if (data.containsKey('is_deleted')) {
      context.handle(
        _isDeletedMeta,
        isDeleted.isAcceptableOrUnknown(data['is_deleted']!, _isDeletedMeta),
      );
    }
    if (data.containsKey('invoice_id')) {
      context.handle(
        _invoiceIdMeta,
        invoiceId.isAcceptableOrUnknown(data['invoice_id']!, _invoiceIdMeta),
      );
    } else if (isInserting) {
      context.missing(_invoiceIdMeta);
    }
    if (data.containsKey('item_id')) {
      context.handle(
        _itemIdMeta,
        itemId.isAcceptableOrUnknown(data['item_id']!, _itemIdMeta),
      );
    }
    if (data.containsKey('name')) {
      context.handle(
        _nameMeta,
        name.isAcceptableOrUnknown(data['name']!, _nameMeta),
      );
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('description')) {
      context.handle(
        _descriptionMeta,
        description.isAcceptableOrUnknown(
          data['description']!,
          _descriptionMeta,
        ),
      );
    }
    if (data.containsKey('quantity')) {
      context.handle(
        _quantityMeta,
        quantity.isAcceptableOrUnknown(data['quantity']!, _quantityMeta),
      );
    }
    if (data.containsKey('unit_price')) {
      context.handle(
        _unitPriceMeta,
        unitPrice.isAcceptableOrUnknown(data['unit_price']!, _unitPriceMeta),
      );
    }
    if (data.containsKey('line_total')) {
      context.handle(
        _lineTotalMeta,
        lineTotal.isAcceptableOrUnknown(data['line_total']!, _lineTotalMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  InvoiceLineItem map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return InvoiceLineItem(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}id'],
      )!,
      updatedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}updated_at'],
      )!,
      isSynced: attachedDatabase.typeMapping.read(
        DriftSqlType.bool,
        data['${effectivePrefix}is_synced'],
      )!,
      isDeleted: attachedDatabase.typeMapping.read(
        DriftSqlType.bool,
        data['${effectivePrefix}is_deleted'],
      )!,
      invoiceId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}invoice_id'],
      )!,
      itemId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}item_id'],
      ),
      name: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}name'],
      )!,
      description: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}description'],
      ),
      quantity: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}quantity'],
      )!,
      unitPrice: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}unit_price'],
      )!,
      lineTotal: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}line_total'],
      )!,
    );
  }

  @override
  $InvoiceLineItemsTable createAlias(String alias) {
    return $InvoiceLineItemsTable(attachedDatabase, alias);
  }
}

class InvoiceLineItem extends DataClass implements Insertable<InvoiceLineItem> {
  final String id;
  final DateTime updatedAt;
  final bool isSynced;
  final bool isDeleted;
  final String invoiceId;
  final String? itemId;
  final String name;
  final String? description;
  final double quantity;
  final double unitPrice;
  final double lineTotal;
  const InvoiceLineItem({
    required this.id,
    required this.updatedAt,
    required this.isSynced,
    required this.isDeleted,
    required this.invoiceId,
    this.itemId,
    required this.name,
    this.description,
    required this.quantity,
    required this.unitPrice,
    required this.lineTotal,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['updated_at'] = Variable<DateTime>(updatedAt);
    map['is_synced'] = Variable<bool>(isSynced);
    map['is_deleted'] = Variable<bool>(isDeleted);
    map['invoice_id'] = Variable<String>(invoiceId);
    if (!nullToAbsent || itemId != null) {
      map['item_id'] = Variable<String>(itemId);
    }
    map['name'] = Variable<String>(name);
    if (!nullToAbsent || description != null) {
      map['description'] = Variable<String>(description);
    }
    map['quantity'] = Variable<double>(quantity);
    map['unit_price'] = Variable<double>(unitPrice);
    map['line_total'] = Variable<double>(lineTotal);
    return map;
  }

  InvoiceLineItemsCompanion toCompanion(bool nullToAbsent) {
    return InvoiceLineItemsCompanion(
      id: Value(id),
      updatedAt: Value(updatedAt),
      isSynced: Value(isSynced),
      isDeleted: Value(isDeleted),
      invoiceId: Value(invoiceId),
      itemId: itemId == null && nullToAbsent
          ? const Value.absent()
          : Value(itemId),
      name: Value(name),
      description: description == null && nullToAbsent
          ? const Value.absent()
          : Value(description),
      quantity: Value(quantity),
      unitPrice: Value(unitPrice),
      lineTotal: Value(lineTotal),
    );
  }

  factory InvoiceLineItem.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return InvoiceLineItem(
      id: serializer.fromJson<String>(json['id']),
      updatedAt: serializer.fromJson<DateTime>(json['updatedAt']),
      isSynced: serializer.fromJson<bool>(json['isSynced']),
      isDeleted: serializer.fromJson<bool>(json['isDeleted']),
      invoiceId: serializer.fromJson<String>(json['invoiceId']),
      itemId: serializer.fromJson<String?>(json['itemId']),
      name: serializer.fromJson<String>(json['name']),
      description: serializer.fromJson<String?>(json['description']),
      quantity: serializer.fromJson<double>(json['quantity']),
      unitPrice: serializer.fromJson<double>(json['unitPrice']),
      lineTotal: serializer.fromJson<double>(json['lineTotal']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'updatedAt': serializer.toJson<DateTime>(updatedAt),
      'isSynced': serializer.toJson<bool>(isSynced),
      'isDeleted': serializer.toJson<bool>(isDeleted),
      'invoiceId': serializer.toJson<String>(invoiceId),
      'itemId': serializer.toJson<String?>(itemId),
      'name': serializer.toJson<String>(name),
      'description': serializer.toJson<String?>(description),
      'quantity': serializer.toJson<double>(quantity),
      'unitPrice': serializer.toJson<double>(unitPrice),
      'lineTotal': serializer.toJson<double>(lineTotal),
    };
  }

  InvoiceLineItem copyWith({
    String? id,
    DateTime? updatedAt,
    bool? isSynced,
    bool? isDeleted,
    String? invoiceId,
    Value<String?> itemId = const Value.absent(),
    String? name,
    Value<String?> description = const Value.absent(),
    double? quantity,
    double? unitPrice,
    double? lineTotal,
  }) => InvoiceLineItem(
    id: id ?? this.id,
    updatedAt: updatedAt ?? this.updatedAt,
    isSynced: isSynced ?? this.isSynced,
    isDeleted: isDeleted ?? this.isDeleted,
    invoiceId: invoiceId ?? this.invoiceId,
    itemId: itemId.present ? itemId.value : this.itemId,
    name: name ?? this.name,
    description: description.present ? description.value : this.description,
    quantity: quantity ?? this.quantity,
    unitPrice: unitPrice ?? this.unitPrice,
    lineTotal: lineTotal ?? this.lineTotal,
  );
  InvoiceLineItem copyWithCompanion(InvoiceLineItemsCompanion data) {
    return InvoiceLineItem(
      id: data.id.present ? data.id.value : this.id,
      updatedAt: data.updatedAt.present ? data.updatedAt.value : this.updatedAt,
      isSynced: data.isSynced.present ? data.isSynced.value : this.isSynced,
      isDeleted: data.isDeleted.present ? data.isDeleted.value : this.isDeleted,
      invoiceId: data.invoiceId.present ? data.invoiceId.value : this.invoiceId,
      itemId: data.itemId.present ? data.itemId.value : this.itemId,
      name: data.name.present ? data.name.value : this.name,
      description: data.description.present
          ? data.description.value
          : this.description,
      quantity: data.quantity.present ? data.quantity.value : this.quantity,
      unitPrice: data.unitPrice.present ? data.unitPrice.value : this.unitPrice,
      lineTotal: data.lineTotal.present ? data.lineTotal.value : this.lineTotal,
    );
  }

  @override
  String toString() {
    return (StringBuffer('InvoiceLineItem(')
          ..write('id: $id, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('isSynced: $isSynced, ')
          ..write('isDeleted: $isDeleted, ')
          ..write('invoiceId: $invoiceId, ')
          ..write('itemId: $itemId, ')
          ..write('name: $name, ')
          ..write('description: $description, ')
          ..write('quantity: $quantity, ')
          ..write('unitPrice: $unitPrice, ')
          ..write('lineTotal: $lineTotal')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    updatedAt,
    isSynced,
    isDeleted,
    invoiceId,
    itemId,
    name,
    description,
    quantity,
    unitPrice,
    lineTotal,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is InvoiceLineItem &&
          other.id == this.id &&
          other.updatedAt == this.updatedAt &&
          other.isSynced == this.isSynced &&
          other.isDeleted == this.isDeleted &&
          other.invoiceId == this.invoiceId &&
          other.itemId == this.itemId &&
          other.name == this.name &&
          other.description == this.description &&
          other.quantity == this.quantity &&
          other.unitPrice == this.unitPrice &&
          other.lineTotal == this.lineTotal);
}

class InvoiceLineItemsCompanion extends UpdateCompanion<InvoiceLineItem> {
  final Value<String> id;
  final Value<DateTime> updatedAt;
  final Value<bool> isSynced;
  final Value<bool> isDeleted;
  final Value<String> invoiceId;
  final Value<String?> itemId;
  final Value<String> name;
  final Value<String?> description;
  final Value<double> quantity;
  final Value<double> unitPrice;
  final Value<double> lineTotal;
  final Value<int> rowid;
  const InvoiceLineItemsCompanion({
    this.id = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.isSynced = const Value.absent(),
    this.isDeleted = const Value.absent(),
    this.invoiceId = const Value.absent(),
    this.itemId = const Value.absent(),
    this.name = const Value.absent(),
    this.description = const Value.absent(),
    this.quantity = const Value.absent(),
    this.unitPrice = const Value.absent(),
    this.lineTotal = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  InvoiceLineItemsCompanion.insert({
    this.id = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.isSynced = const Value.absent(),
    this.isDeleted = const Value.absent(),
    required String invoiceId,
    this.itemId = const Value.absent(),
    required String name,
    this.description = const Value.absent(),
    this.quantity = const Value.absent(),
    this.unitPrice = const Value.absent(),
    this.lineTotal = const Value.absent(),
    this.rowid = const Value.absent(),
  }) : invoiceId = Value(invoiceId),
       name = Value(name);
  static Insertable<InvoiceLineItem> custom({
    Expression<String>? id,
    Expression<DateTime>? updatedAt,
    Expression<bool>? isSynced,
    Expression<bool>? isDeleted,
    Expression<String>? invoiceId,
    Expression<String>? itemId,
    Expression<String>? name,
    Expression<String>? description,
    Expression<double>? quantity,
    Expression<double>? unitPrice,
    Expression<double>? lineTotal,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (updatedAt != null) 'updated_at': updatedAt,
      if (isSynced != null) 'is_synced': isSynced,
      if (isDeleted != null) 'is_deleted': isDeleted,
      if (invoiceId != null) 'invoice_id': invoiceId,
      if (itemId != null) 'item_id': itemId,
      if (name != null) 'name': name,
      if (description != null) 'description': description,
      if (quantity != null) 'quantity': quantity,
      if (unitPrice != null) 'unit_price': unitPrice,
      if (lineTotal != null) 'line_total': lineTotal,
      if (rowid != null) 'rowid': rowid,
    });
  }

  InvoiceLineItemsCompanion copyWith({
    Value<String>? id,
    Value<DateTime>? updatedAt,
    Value<bool>? isSynced,
    Value<bool>? isDeleted,
    Value<String>? invoiceId,
    Value<String?>? itemId,
    Value<String>? name,
    Value<String?>? description,
    Value<double>? quantity,
    Value<double>? unitPrice,
    Value<double>? lineTotal,
    Value<int>? rowid,
  }) {
    return InvoiceLineItemsCompanion(
      id: id ?? this.id,
      updatedAt: updatedAt ?? this.updatedAt,
      isSynced: isSynced ?? this.isSynced,
      isDeleted: isDeleted ?? this.isDeleted,
      invoiceId: invoiceId ?? this.invoiceId,
      itemId: itemId ?? this.itemId,
      name: name ?? this.name,
      description: description ?? this.description,
      quantity: quantity ?? this.quantity,
      unitPrice: unitPrice ?? this.unitPrice,
      lineTotal: lineTotal ?? this.lineTotal,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (updatedAt.present) {
      map['updated_at'] = Variable<DateTime>(updatedAt.value);
    }
    if (isSynced.present) {
      map['is_synced'] = Variable<bool>(isSynced.value);
    }
    if (isDeleted.present) {
      map['is_deleted'] = Variable<bool>(isDeleted.value);
    }
    if (invoiceId.present) {
      map['invoice_id'] = Variable<String>(invoiceId.value);
    }
    if (itemId.present) {
      map['item_id'] = Variable<String>(itemId.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (description.present) {
      map['description'] = Variable<String>(description.value);
    }
    if (quantity.present) {
      map['quantity'] = Variable<double>(quantity.value);
    }
    if (unitPrice.present) {
      map['unit_price'] = Variable<double>(unitPrice.value);
    }
    if (lineTotal.present) {
      map['line_total'] = Variable<double>(lineTotal.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('InvoiceLineItemsCompanion(')
          ..write('id: $id, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('isSynced: $isSynced, ')
          ..write('isDeleted: $isDeleted, ')
          ..write('invoiceId: $invoiceId, ')
          ..write('itemId: $itemId, ')
          ..write('name: $name, ')
          ..write('description: $description, ')
          ..write('quantity: $quantity, ')
          ..write('unitPrice: $unitPrice, ')
          ..write('lineTotal: $lineTotal, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

abstract class _$AppDatabase extends GeneratedDatabase {
  _$AppDatabase(QueryExecutor e) : super(e);
  $AppDatabaseManager get managers => $AppDatabaseManager(this);
  late final $BusinessProfileTable businessProfile = $BusinessProfileTable(
    this,
  );
  late final $ClientsTable clients = $ClientsTable(this);
  late final $ItemsTable items = $ItemsTable(this);
  late final $InvoicesTable invoices = $InvoicesTable(this);
  late final $InvoiceLineItemsTable invoiceLineItems = $InvoiceLineItemsTable(
    this,
  );
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [
    businessProfile,
    clients,
    items,
    invoices,
    invoiceLineItems,
  ];
}

typedef $$BusinessProfileTableCreateCompanionBuilder =
    BusinessProfileCompanion Function({
      Value<String> id,
      Value<DateTime> updatedAt,
      Value<bool> isSynced,
      Value<bool> isDeleted,
      required String name,
      Value<String?> email,
      Value<String?> phone,
      Value<String?> address,
      Value<String?> taxNumber,
      Value<String?> logoUri,
      Value<int> rowid,
    });
typedef $$BusinessProfileTableUpdateCompanionBuilder =
    BusinessProfileCompanion Function({
      Value<String> id,
      Value<DateTime> updatedAt,
      Value<bool> isSynced,
      Value<bool> isDeleted,
      Value<String> name,
      Value<String?> email,
      Value<String?> phone,
      Value<String?> address,
      Value<String?> taxNumber,
      Value<String?> logoUri,
      Value<int> rowid,
    });

class $$BusinessProfileTableFilterComposer
    extends Composer<_$AppDatabase, $BusinessProfileTable> {
  $$BusinessProfileTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<bool> get isSynced => $composableBuilder(
    column: $table.isSynced,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<bool> get isDeleted => $composableBuilder(
    column: $table.isDeleted,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get email => $composableBuilder(
    column: $table.email,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get phone => $composableBuilder(
    column: $table.phone,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get address => $composableBuilder(
    column: $table.address,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get taxNumber => $composableBuilder(
    column: $table.taxNumber,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get logoUri => $composableBuilder(
    column: $table.logoUri,
    builder: (column) => ColumnFilters(column),
  );
}

class $$BusinessProfileTableOrderingComposer
    extends Composer<_$AppDatabase, $BusinessProfileTable> {
  $$BusinessProfileTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get isSynced => $composableBuilder(
    column: $table.isSynced,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get isDeleted => $composableBuilder(
    column: $table.isDeleted,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get email => $composableBuilder(
    column: $table.email,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get phone => $composableBuilder(
    column: $table.phone,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get address => $composableBuilder(
    column: $table.address,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get taxNumber => $composableBuilder(
    column: $table.taxNumber,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get logoUri => $composableBuilder(
    column: $table.logoUri,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$BusinessProfileTableAnnotationComposer
    extends Composer<_$AppDatabase, $BusinessProfileTable> {
  $$BusinessProfileTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<DateTime> get updatedAt =>
      $composableBuilder(column: $table.updatedAt, builder: (column) => column);

  GeneratedColumn<bool> get isSynced =>
      $composableBuilder(column: $table.isSynced, builder: (column) => column);

  GeneratedColumn<bool> get isDeleted =>
      $composableBuilder(column: $table.isDeleted, builder: (column) => column);

  GeneratedColumn<String> get name =>
      $composableBuilder(column: $table.name, builder: (column) => column);

  GeneratedColumn<String> get email =>
      $composableBuilder(column: $table.email, builder: (column) => column);

  GeneratedColumn<String> get phone =>
      $composableBuilder(column: $table.phone, builder: (column) => column);

  GeneratedColumn<String> get address =>
      $composableBuilder(column: $table.address, builder: (column) => column);

  GeneratedColumn<String> get taxNumber =>
      $composableBuilder(column: $table.taxNumber, builder: (column) => column);

  GeneratedColumn<String> get logoUri =>
      $composableBuilder(column: $table.logoUri, builder: (column) => column);
}

class $$BusinessProfileTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $BusinessProfileTable,
          BusinessProfileData,
          $$BusinessProfileTableFilterComposer,
          $$BusinessProfileTableOrderingComposer,
          $$BusinessProfileTableAnnotationComposer,
          $$BusinessProfileTableCreateCompanionBuilder,
          $$BusinessProfileTableUpdateCompanionBuilder,
          (
            BusinessProfileData,
            BaseReferences<
              _$AppDatabase,
              $BusinessProfileTable,
              BusinessProfileData
            >,
          ),
          BusinessProfileData,
          PrefetchHooks Function()
        > {
  $$BusinessProfileTableTableManager(
    _$AppDatabase db,
    $BusinessProfileTable table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$BusinessProfileTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$BusinessProfileTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$BusinessProfileTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> id = const Value.absent(),
                Value<DateTime> updatedAt = const Value.absent(),
                Value<bool> isSynced = const Value.absent(),
                Value<bool> isDeleted = const Value.absent(),
                Value<String> name = const Value.absent(),
                Value<String?> email = const Value.absent(),
                Value<String?> phone = const Value.absent(),
                Value<String?> address = const Value.absent(),
                Value<String?> taxNumber = const Value.absent(),
                Value<String?> logoUri = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => BusinessProfileCompanion(
                id: id,
                updatedAt: updatedAt,
                isSynced: isSynced,
                isDeleted: isDeleted,
                name: name,
                email: email,
                phone: phone,
                address: address,
                taxNumber: taxNumber,
                logoUri: logoUri,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                Value<String> id = const Value.absent(),
                Value<DateTime> updatedAt = const Value.absent(),
                Value<bool> isSynced = const Value.absent(),
                Value<bool> isDeleted = const Value.absent(),
                required String name,
                Value<String?> email = const Value.absent(),
                Value<String?> phone = const Value.absent(),
                Value<String?> address = const Value.absent(),
                Value<String?> taxNumber = const Value.absent(),
                Value<String?> logoUri = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => BusinessProfileCompanion.insert(
                id: id,
                updatedAt: updatedAt,
                isSynced: isSynced,
                isDeleted: isDeleted,
                name: name,
                email: email,
                phone: phone,
                address: address,
                taxNumber: taxNumber,
                logoUri: logoUri,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$BusinessProfileTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $BusinessProfileTable,
      BusinessProfileData,
      $$BusinessProfileTableFilterComposer,
      $$BusinessProfileTableOrderingComposer,
      $$BusinessProfileTableAnnotationComposer,
      $$BusinessProfileTableCreateCompanionBuilder,
      $$BusinessProfileTableUpdateCompanionBuilder,
      (
        BusinessProfileData,
        BaseReferences<
          _$AppDatabase,
          $BusinessProfileTable,
          BusinessProfileData
        >,
      ),
      BusinessProfileData,
      PrefetchHooks Function()
    >;
typedef $$ClientsTableCreateCompanionBuilder =
    ClientsCompanion Function({
      Value<String> id,
      Value<DateTime> updatedAt,
      Value<bool> isSynced,
      Value<bool> isDeleted,
      required String name,
      Value<String?> email,
      Value<String?> phone,
      Value<String?> billingAddress,
      Value<String?> notes,
      Value<int> rowid,
    });
typedef $$ClientsTableUpdateCompanionBuilder =
    ClientsCompanion Function({
      Value<String> id,
      Value<DateTime> updatedAt,
      Value<bool> isSynced,
      Value<bool> isDeleted,
      Value<String> name,
      Value<String?> email,
      Value<String?> phone,
      Value<String?> billingAddress,
      Value<String?> notes,
      Value<int> rowid,
    });

final class $$ClientsTableReferences
    extends BaseReferences<_$AppDatabase, $ClientsTable, Client> {
  $$ClientsTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static MultiTypedResultKey<$InvoicesTable, List<Invoice>> _invoicesRefsTable(
    _$AppDatabase db,
  ) => MultiTypedResultKey.fromTable(
    db.invoices,
    aliasName: 'clients__id__invoices__client_id',
  );

  $$InvoicesTableProcessedTableManager get invoicesRefs {
    final manager = $$InvoicesTableTableManager(
      $_db,
      $_db.invoices,
    ).filter((f) => f.clientId.id.sqlEquals($_itemColumn<String>('id')!));

    final cache = $_typedResult.readTableOrNull(_invoicesRefsTable($_db));
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }
}

class $$ClientsTableFilterComposer
    extends Composer<_$AppDatabase, $ClientsTable> {
  $$ClientsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<bool> get isSynced => $composableBuilder(
    column: $table.isSynced,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<bool> get isDeleted => $composableBuilder(
    column: $table.isDeleted,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get email => $composableBuilder(
    column: $table.email,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get phone => $composableBuilder(
    column: $table.phone,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get billingAddress => $composableBuilder(
    column: $table.billingAddress,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get notes => $composableBuilder(
    column: $table.notes,
    builder: (column) => ColumnFilters(column),
  );

  Expression<bool> invoicesRefs(
    Expression<bool> Function($$InvoicesTableFilterComposer f) f,
  ) {
    final $$InvoicesTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.invoices,
      getReferencedColumn: (t) => t.clientId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$InvoicesTableFilterComposer(
            $db: $db,
            $table: $db.invoices,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$ClientsTableOrderingComposer
    extends Composer<_$AppDatabase, $ClientsTable> {
  $$ClientsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get isSynced => $composableBuilder(
    column: $table.isSynced,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get isDeleted => $composableBuilder(
    column: $table.isDeleted,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get email => $composableBuilder(
    column: $table.email,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get phone => $composableBuilder(
    column: $table.phone,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get billingAddress => $composableBuilder(
    column: $table.billingAddress,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get notes => $composableBuilder(
    column: $table.notes,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$ClientsTableAnnotationComposer
    extends Composer<_$AppDatabase, $ClientsTable> {
  $$ClientsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<DateTime> get updatedAt =>
      $composableBuilder(column: $table.updatedAt, builder: (column) => column);

  GeneratedColumn<bool> get isSynced =>
      $composableBuilder(column: $table.isSynced, builder: (column) => column);

  GeneratedColumn<bool> get isDeleted =>
      $composableBuilder(column: $table.isDeleted, builder: (column) => column);

  GeneratedColumn<String> get name =>
      $composableBuilder(column: $table.name, builder: (column) => column);

  GeneratedColumn<String> get email =>
      $composableBuilder(column: $table.email, builder: (column) => column);

  GeneratedColumn<String> get phone =>
      $composableBuilder(column: $table.phone, builder: (column) => column);

  GeneratedColumn<String> get billingAddress => $composableBuilder(
    column: $table.billingAddress,
    builder: (column) => column,
  );

  GeneratedColumn<String> get notes =>
      $composableBuilder(column: $table.notes, builder: (column) => column);

  Expression<T> invoicesRefs<T extends Object>(
    Expression<T> Function($$InvoicesTableAnnotationComposer a) f,
  ) {
    final $$InvoicesTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.invoices,
      getReferencedColumn: (t) => t.clientId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$InvoicesTableAnnotationComposer(
            $db: $db,
            $table: $db.invoices,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$ClientsTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $ClientsTable,
          Client,
          $$ClientsTableFilterComposer,
          $$ClientsTableOrderingComposer,
          $$ClientsTableAnnotationComposer,
          $$ClientsTableCreateCompanionBuilder,
          $$ClientsTableUpdateCompanionBuilder,
          (Client, $$ClientsTableReferences),
          Client,
          PrefetchHooks Function({bool invoicesRefs})
        > {
  $$ClientsTableTableManager(_$AppDatabase db, $ClientsTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$ClientsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$ClientsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$ClientsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> id = const Value.absent(),
                Value<DateTime> updatedAt = const Value.absent(),
                Value<bool> isSynced = const Value.absent(),
                Value<bool> isDeleted = const Value.absent(),
                Value<String> name = const Value.absent(),
                Value<String?> email = const Value.absent(),
                Value<String?> phone = const Value.absent(),
                Value<String?> billingAddress = const Value.absent(),
                Value<String?> notes = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => ClientsCompanion(
                id: id,
                updatedAt: updatedAt,
                isSynced: isSynced,
                isDeleted: isDeleted,
                name: name,
                email: email,
                phone: phone,
                billingAddress: billingAddress,
                notes: notes,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                Value<String> id = const Value.absent(),
                Value<DateTime> updatedAt = const Value.absent(),
                Value<bool> isSynced = const Value.absent(),
                Value<bool> isDeleted = const Value.absent(),
                required String name,
                Value<String?> email = const Value.absent(),
                Value<String?> phone = const Value.absent(),
                Value<String?> billingAddress = const Value.absent(),
                Value<String?> notes = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => ClientsCompanion.insert(
                id: id,
                updatedAt: updatedAt,
                isSynced: isSynced,
                isDeleted: isDeleted,
                name: name,
                email: email,
                phone: phone,
                billingAddress: billingAddress,
                notes: notes,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable(table),
                  $$ClientsTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback: ({invoicesRefs = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [if (invoicesRefs) db.invoices],
              addJoins: null,
              getPrefetchedDataCallback: (items) async {
                return [
                  if (invoicesRefs)
                    await $_getPrefetchedData<Client, $ClientsTable, Invoice>(
                      currentTable: table,
                      referencedTable: $$ClientsTableReferences
                          ._invoicesRefsTable(db),
                      managerFromTypedResult: (p0) =>
                          $$ClientsTableReferences(db, table, p0).invoicesRefs,
                      referencedItemsForCurrentItem: (item, referencedItems) =>
                          referencedItems.where((e) => e.clientId == item.id),
                      typedResults: items,
                    ),
                ];
              },
            );
          },
        ),
      );
}

typedef $$ClientsTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $ClientsTable,
      Client,
      $$ClientsTableFilterComposer,
      $$ClientsTableOrderingComposer,
      $$ClientsTableAnnotationComposer,
      $$ClientsTableCreateCompanionBuilder,
      $$ClientsTableUpdateCompanionBuilder,
      (Client, $$ClientsTableReferences),
      Client,
      PrefetchHooks Function({bool invoicesRefs})
    >;
typedef $$ItemsTableCreateCompanionBuilder =
    ItemsCompanion Function({
      Value<String> id,
      Value<DateTime> updatedAt,
      Value<bool> isSynced,
      Value<bool> isDeleted,
      required String name,
      Value<String?> description,
      Value<double> unitPrice,
      Value<String> unitType,
      Value<bool> taxable,
      Value<int> rowid,
    });
typedef $$ItemsTableUpdateCompanionBuilder =
    ItemsCompanion Function({
      Value<String> id,
      Value<DateTime> updatedAt,
      Value<bool> isSynced,
      Value<bool> isDeleted,
      Value<String> name,
      Value<String?> description,
      Value<double> unitPrice,
      Value<String> unitType,
      Value<bool> taxable,
      Value<int> rowid,
    });

class $$ItemsTableFilterComposer extends Composer<_$AppDatabase, $ItemsTable> {
  $$ItemsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<bool> get isSynced => $composableBuilder(
    column: $table.isSynced,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<bool> get isDeleted => $composableBuilder(
    column: $table.isDeleted,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get description => $composableBuilder(
    column: $table.description,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get unitPrice => $composableBuilder(
    column: $table.unitPrice,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get unitType => $composableBuilder(
    column: $table.unitType,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<bool> get taxable => $composableBuilder(
    column: $table.taxable,
    builder: (column) => ColumnFilters(column),
  );
}

class $$ItemsTableOrderingComposer
    extends Composer<_$AppDatabase, $ItemsTable> {
  $$ItemsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get isSynced => $composableBuilder(
    column: $table.isSynced,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get isDeleted => $composableBuilder(
    column: $table.isDeleted,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get description => $composableBuilder(
    column: $table.description,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get unitPrice => $composableBuilder(
    column: $table.unitPrice,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get unitType => $composableBuilder(
    column: $table.unitType,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get taxable => $composableBuilder(
    column: $table.taxable,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$ItemsTableAnnotationComposer
    extends Composer<_$AppDatabase, $ItemsTable> {
  $$ItemsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<DateTime> get updatedAt =>
      $composableBuilder(column: $table.updatedAt, builder: (column) => column);

  GeneratedColumn<bool> get isSynced =>
      $composableBuilder(column: $table.isSynced, builder: (column) => column);

  GeneratedColumn<bool> get isDeleted =>
      $composableBuilder(column: $table.isDeleted, builder: (column) => column);

  GeneratedColumn<String> get name =>
      $composableBuilder(column: $table.name, builder: (column) => column);

  GeneratedColumn<String> get description => $composableBuilder(
    column: $table.description,
    builder: (column) => column,
  );

  GeneratedColumn<double> get unitPrice =>
      $composableBuilder(column: $table.unitPrice, builder: (column) => column);

  GeneratedColumn<String> get unitType =>
      $composableBuilder(column: $table.unitType, builder: (column) => column);

  GeneratedColumn<bool> get taxable =>
      $composableBuilder(column: $table.taxable, builder: (column) => column);
}

class $$ItemsTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $ItemsTable,
          Item,
          $$ItemsTableFilterComposer,
          $$ItemsTableOrderingComposer,
          $$ItemsTableAnnotationComposer,
          $$ItemsTableCreateCompanionBuilder,
          $$ItemsTableUpdateCompanionBuilder,
          (Item, BaseReferences<_$AppDatabase, $ItemsTable, Item>),
          Item,
          PrefetchHooks Function()
        > {
  $$ItemsTableTableManager(_$AppDatabase db, $ItemsTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$ItemsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$ItemsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$ItemsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> id = const Value.absent(),
                Value<DateTime> updatedAt = const Value.absent(),
                Value<bool> isSynced = const Value.absent(),
                Value<bool> isDeleted = const Value.absent(),
                Value<String> name = const Value.absent(),
                Value<String?> description = const Value.absent(),
                Value<double> unitPrice = const Value.absent(),
                Value<String> unitType = const Value.absent(),
                Value<bool> taxable = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => ItemsCompanion(
                id: id,
                updatedAt: updatedAt,
                isSynced: isSynced,
                isDeleted: isDeleted,
                name: name,
                description: description,
                unitPrice: unitPrice,
                unitType: unitType,
                taxable: taxable,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                Value<String> id = const Value.absent(),
                Value<DateTime> updatedAt = const Value.absent(),
                Value<bool> isSynced = const Value.absent(),
                Value<bool> isDeleted = const Value.absent(),
                required String name,
                Value<String?> description = const Value.absent(),
                Value<double> unitPrice = const Value.absent(),
                Value<String> unitType = const Value.absent(),
                Value<bool> taxable = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => ItemsCompanion.insert(
                id: id,
                updatedAt: updatedAt,
                isSynced: isSynced,
                isDeleted: isDeleted,
                name: name,
                description: description,
                unitPrice: unitPrice,
                unitType: unitType,
                taxable: taxable,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$ItemsTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $ItemsTable,
      Item,
      $$ItemsTableFilterComposer,
      $$ItemsTableOrderingComposer,
      $$ItemsTableAnnotationComposer,
      $$ItemsTableCreateCompanionBuilder,
      $$ItemsTableUpdateCompanionBuilder,
      (Item, BaseReferences<_$AppDatabase, $ItemsTable, Item>),
      Item,
      PrefetchHooks Function()
    >;
typedef $$InvoicesTableCreateCompanionBuilder =
    InvoicesCompanion Function({
      Value<String> id,
      Value<DateTime> updatedAt,
      Value<bool> isSynced,
      Value<bool> isDeleted,
      required String invoiceNumber,
      required String clientId,
      required DateTime issueDate,
      Value<DateTime?> dueDate,
      Value<String> status,
      Value<double> subtotal,
      Value<double> taxTotal,
      Value<double> discountTotal,
      Value<double> grandTotal,
      Value<String?> terms,
      Value<int> rowid,
    });
typedef $$InvoicesTableUpdateCompanionBuilder =
    InvoicesCompanion Function({
      Value<String> id,
      Value<DateTime> updatedAt,
      Value<bool> isSynced,
      Value<bool> isDeleted,
      Value<String> invoiceNumber,
      Value<String> clientId,
      Value<DateTime> issueDate,
      Value<DateTime?> dueDate,
      Value<String> status,
      Value<double> subtotal,
      Value<double> taxTotal,
      Value<double> discountTotal,
      Value<double> grandTotal,
      Value<String?> terms,
      Value<int> rowid,
    });

final class $$InvoicesTableReferences
    extends BaseReferences<_$AppDatabase, $InvoicesTable, Invoice> {
  $$InvoicesTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static $ClientsTable _clientIdTable(_$AppDatabase db) =>
      db.clients.createAlias('invoices__client_id__clients__id');

  $$ClientsTableProcessedTableManager get clientId {
    final $_column = $_itemColumn<String>('client_id')!;

    final manager = $$ClientsTableTableManager(
      $_db,
      $_db.clients,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_clientIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }

  static MultiTypedResultKey<$InvoiceLineItemsTable, List<InvoiceLineItem>>
  _invoiceLineItemsRefsTable(_$AppDatabase db) => MultiTypedResultKey.fromTable(
    db.invoiceLineItems,
    aliasName: 'invoices__id__invoice_line_items__invoice_id',
  );

  $$InvoiceLineItemsTableProcessedTableManager get invoiceLineItemsRefs {
    final manager = $$InvoiceLineItemsTableTableManager(
      $_db,
      $_db.invoiceLineItems,
    ).filter((f) => f.invoiceId.id.sqlEquals($_itemColumn<String>('id')!));

    final cache = $_typedResult.readTableOrNull(
      _invoiceLineItemsRefsTable($_db),
    );
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }
}

class $$InvoicesTableFilterComposer
    extends Composer<_$AppDatabase, $InvoicesTable> {
  $$InvoicesTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<bool> get isSynced => $composableBuilder(
    column: $table.isSynced,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<bool> get isDeleted => $composableBuilder(
    column: $table.isDeleted,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get invoiceNumber => $composableBuilder(
    column: $table.invoiceNumber,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get issueDate => $composableBuilder(
    column: $table.issueDate,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get dueDate => $composableBuilder(
    column: $table.dueDate,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get status => $composableBuilder(
    column: $table.status,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get subtotal => $composableBuilder(
    column: $table.subtotal,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get taxTotal => $composableBuilder(
    column: $table.taxTotal,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get discountTotal => $composableBuilder(
    column: $table.discountTotal,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get grandTotal => $composableBuilder(
    column: $table.grandTotal,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get terms => $composableBuilder(
    column: $table.terms,
    builder: (column) => ColumnFilters(column),
  );

  $$ClientsTableFilterComposer get clientId {
    final $$ClientsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.clientId,
      referencedTable: $db.clients,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$ClientsTableFilterComposer(
            $db: $db,
            $table: $db.clients,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  Expression<bool> invoiceLineItemsRefs(
    Expression<bool> Function($$InvoiceLineItemsTableFilterComposer f) f,
  ) {
    final $$InvoiceLineItemsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.invoiceLineItems,
      getReferencedColumn: (t) => t.invoiceId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$InvoiceLineItemsTableFilterComposer(
            $db: $db,
            $table: $db.invoiceLineItems,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$InvoicesTableOrderingComposer
    extends Composer<_$AppDatabase, $InvoicesTable> {
  $$InvoicesTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get isSynced => $composableBuilder(
    column: $table.isSynced,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get isDeleted => $composableBuilder(
    column: $table.isDeleted,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get invoiceNumber => $composableBuilder(
    column: $table.invoiceNumber,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get issueDate => $composableBuilder(
    column: $table.issueDate,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get dueDate => $composableBuilder(
    column: $table.dueDate,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get status => $composableBuilder(
    column: $table.status,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get subtotal => $composableBuilder(
    column: $table.subtotal,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get taxTotal => $composableBuilder(
    column: $table.taxTotal,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get discountTotal => $composableBuilder(
    column: $table.discountTotal,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get grandTotal => $composableBuilder(
    column: $table.grandTotal,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get terms => $composableBuilder(
    column: $table.terms,
    builder: (column) => ColumnOrderings(column),
  );

  $$ClientsTableOrderingComposer get clientId {
    final $$ClientsTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.clientId,
      referencedTable: $db.clients,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$ClientsTableOrderingComposer(
            $db: $db,
            $table: $db.clients,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$InvoicesTableAnnotationComposer
    extends Composer<_$AppDatabase, $InvoicesTable> {
  $$InvoicesTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<DateTime> get updatedAt =>
      $composableBuilder(column: $table.updatedAt, builder: (column) => column);

  GeneratedColumn<bool> get isSynced =>
      $composableBuilder(column: $table.isSynced, builder: (column) => column);

  GeneratedColumn<bool> get isDeleted =>
      $composableBuilder(column: $table.isDeleted, builder: (column) => column);

  GeneratedColumn<String> get invoiceNumber => $composableBuilder(
    column: $table.invoiceNumber,
    builder: (column) => column,
  );

  GeneratedColumn<DateTime> get issueDate =>
      $composableBuilder(column: $table.issueDate, builder: (column) => column);

  GeneratedColumn<DateTime> get dueDate =>
      $composableBuilder(column: $table.dueDate, builder: (column) => column);

  GeneratedColumn<String> get status =>
      $composableBuilder(column: $table.status, builder: (column) => column);

  GeneratedColumn<double> get subtotal =>
      $composableBuilder(column: $table.subtotal, builder: (column) => column);

  GeneratedColumn<double> get taxTotal =>
      $composableBuilder(column: $table.taxTotal, builder: (column) => column);

  GeneratedColumn<double> get discountTotal => $composableBuilder(
    column: $table.discountTotal,
    builder: (column) => column,
  );

  GeneratedColumn<double> get grandTotal => $composableBuilder(
    column: $table.grandTotal,
    builder: (column) => column,
  );

  GeneratedColumn<String> get terms =>
      $composableBuilder(column: $table.terms, builder: (column) => column);

  $$ClientsTableAnnotationComposer get clientId {
    final $$ClientsTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.clientId,
      referencedTable: $db.clients,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$ClientsTableAnnotationComposer(
            $db: $db,
            $table: $db.clients,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  Expression<T> invoiceLineItemsRefs<T extends Object>(
    Expression<T> Function($$InvoiceLineItemsTableAnnotationComposer a) f,
  ) {
    final $$InvoiceLineItemsTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.invoiceLineItems,
      getReferencedColumn: (t) => t.invoiceId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$InvoiceLineItemsTableAnnotationComposer(
            $db: $db,
            $table: $db.invoiceLineItems,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$InvoicesTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $InvoicesTable,
          Invoice,
          $$InvoicesTableFilterComposer,
          $$InvoicesTableOrderingComposer,
          $$InvoicesTableAnnotationComposer,
          $$InvoicesTableCreateCompanionBuilder,
          $$InvoicesTableUpdateCompanionBuilder,
          (Invoice, $$InvoicesTableReferences),
          Invoice,
          PrefetchHooks Function({bool clientId, bool invoiceLineItemsRefs})
        > {
  $$InvoicesTableTableManager(_$AppDatabase db, $InvoicesTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$InvoicesTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$InvoicesTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$InvoicesTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> id = const Value.absent(),
                Value<DateTime> updatedAt = const Value.absent(),
                Value<bool> isSynced = const Value.absent(),
                Value<bool> isDeleted = const Value.absent(),
                Value<String> invoiceNumber = const Value.absent(),
                Value<String> clientId = const Value.absent(),
                Value<DateTime> issueDate = const Value.absent(),
                Value<DateTime?> dueDate = const Value.absent(),
                Value<String> status = const Value.absent(),
                Value<double> subtotal = const Value.absent(),
                Value<double> taxTotal = const Value.absent(),
                Value<double> discountTotal = const Value.absent(),
                Value<double> grandTotal = const Value.absent(),
                Value<String?> terms = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => InvoicesCompanion(
                id: id,
                updatedAt: updatedAt,
                isSynced: isSynced,
                isDeleted: isDeleted,
                invoiceNumber: invoiceNumber,
                clientId: clientId,
                issueDate: issueDate,
                dueDate: dueDate,
                status: status,
                subtotal: subtotal,
                taxTotal: taxTotal,
                discountTotal: discountTotal,
                grandTotal: grandTotal,
                terms: terms,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                Value<String> id = const Value.absent(),
                Value<DateTime> updatedAt = const Value.absent(),
                Value<bool> isSynced = const Value.absent(),
                Value<bool> isDeleted = const Value.absent(),
                required String invoiceNumber,
                required String clientId,
                required DateTime issueDate,
                Value<DateTime?> dueDate = const Value.absent(),
                Value<String> status = const Value.absent(),
                Value<double> subtotal = const Value.absent(),
                Value<double> taxTotal = const Value.absent(),
                Value<double> discountTotal = const Value.absent(),
                Value<double> grandTotal = const Value.absent(),
                Value<String?> terms = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => InvoicesCompanion.insert(
                id: id,
                updatedAt: updatedAt,
                isSynced: isSynced,
                isDeleted: isDeleted,
                invoiceNumber: invoiceNumber,
                clientId: clientId,
                issueDate: issueDate,
                dueDate: dueDate,
                status: status,
                subtotal: subtotal,
                taxTotal: taxTotal,
                discountTotal: discountTotal,
                grandTotal: grandTotal,
                terms: terms,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable(table),
                  $$InvoicesTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback:
              ({clientId = false, invoiceLineItemsRefs = false}) {
                return PrefetchHooks(
                  db: db,
                  explicitlyWatchedTables: [
                    if (invoiceLineItemsRefs) db.invoiceLineItems,
                  ],
                  addJoins:
                      <
                        T extends TableManagerState<
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic
                        >
                      >(state) {
                        if (clientId) {
                          state =
                              state.withJoin(
                                    currentTable: table,
                                    currentColumn: table.clientId,
                                    referencedTable: $$InvoicesTableReferences
                                        ._clientIdTable(db),
                                    referencedColumn: $$InvoicesTableReferences
                                        ._clientIdTable(db)
                                        .id,
                                  )
                                  as T;
                        }

                        return state;
                      },
                  getPrefetchedDataCallback: (items) async {
                    return [
                      if (invoiceLineItemsRefs)
                        await $_getPrefetchedData<
                          Invoice,
                          $InvoicesTable,
                          InvoiceLineItem
                        >(
                          currentTable: table,
                          referencedTable: $$InvoicesTableReferences
                              ._invoiceLineItemsRefsTable(db),
                          managerFromTypedResult: (p0) =>
                              $$InvoicesTableReferences(
                                db,
                                table,
                                p0,
                              ).invoiceLineItemsRefs,
                          referencedItemsForCurrentItem:
                              (item, referencedItems) => referencedItems.where(
                                (e) => e.invoiceId == item.id,
                              ),
                          typedResults: items,
                        ),
                    ];
                  },
                );
              },
        ),
      );
}

typedef $$InvoicesTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $InvoicesTable,
      Invoice,
      $$InvoicesTableFilterComposer,
      $$InvoicesTableOrderingComposer,
      $$InvoicesTableAnnotationComposer,
      $$InvoicesTableCreateCompanionBuilder,
      $$InvoicesTableUpdateCompanionBuilder,
      (Invoice, $$InvoicesTableReferences),
      Invoice,
      PrefetchHooks Function({bool clientId, bool invoiceLineItemsRefs})
    >;
typedef $$InvoiceLineItemsTableCreateCompanionBuilder =
    InvoiceLineItemsCompanion Function({
      Value<String> id,
      Value<DateTime> updatedAt,
      Value<bool> isSynced,
      Value<bool> isDeleted,
      required String invoiceId,
      Value<String?> itemId,
      required String name,
      Value<String?> description,
      Value<double> quantity,
      Value<double> unitPrice,
      Value<double> lineTotal,
      Value<int> rowid,
    });
typedef $$InvoiceLineItemsTableUpdateCompanionBuilder =
    InvoiceLineItemsCompanion Function({
      Value<String> id,
      Value<DateTime> updatedAt,
      Value<bool> isSynced,
      Value<bool> isDeleted,
      Value<String> invoiceId,
      Value<String?> itemId,
      Value<String> name,
      Value<String?> description,
      Value<double> quantity,
      Value<double> unitPrice,
      Value<double> lineTotal,
      Value<int> rowid,
    });

final class $$InvoiceLineItemsTableReferences
    extends
        BaseReferences<_$AppDatabase, $InvoiceLineItemsTable, InvoiceLineItem> {
  $$InvoiceLineItemsTableReferences(
    super.$_db,
    super.$_table,
    super.$_typedResult,
  );

  static $InvoicesTable _invoiceIdTable(_$AppDatabase db) =>
      db.invoices.createAlias('invoice_line_items__invoice_id__invoices__id');

  $$InvoicesTableProcessedTableManager get invoiceId {
    final $_column = $_itemColumn<String>('invoice_id')!;

    final manager = $$InvoicesTableTableManager(
      $_db,
      $_db.invoices,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_invoiceIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }
}

class $$InvoiceLineItemsTableFilterComposer
    extends Composer<_$AppDatabase, $InvoiceLineItemsTable> {
  $$InvoiceLineItemsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<bool> get isSynced => $composableBuilder(
    column: $table.isSynced,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<bool> get isDeleted => $composableBuilder(
    column: $table.isDeleted,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get itemId => $composableBuilder(
    column: $table.itemId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get description => $composableBuilder(
    column: $table.description,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get quantity => $composableBuilder(
    column: $table.quantity,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get unitPrice => $composableBuilder(
    column: $table.unitPrice,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get lineTotal => $composableBuilder(
    column: $table.lineTotal,
    builder: (column) => ColumnFilters(column),
  );

  $$InvoicesTableFilterComposer get invoiceId {
    final $$InvoicesTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.invoiceId,
      referencedTable: $db.invoices,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$InvoicesTableFilterComposer(
            $db: $db,
            $table: $db.invoices,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$InvoiceLineItemsTableOrderingComposer
    extends Composer<_$AppDatabase, $InvoiceLineItemsTable> {
  $$InvoiceLineItemsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get isSynced => $composableBuilder(
    column: $table.isSynced,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get isDeleted => $composableBuilder(
    column: $table.isDeleted,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get itemId => $composableBuilder(
    column: $table.itemId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get description => $composableBuilder(
    column: $table.description,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get quantity => $composableBuilder(
    column: $table.quantity,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get unitPrice => $composableBuilder(
    column: $table.unitPrice,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get lineTotal => $composableBuilder(
    column: $table.lineTotal,
    builder: (column) => ColumnOrderings(column),
  );

  $$InvoicesTableOrderingComposer get invoiceId {
    final $$InvoicesTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.invoiceId,
      referencedTable: $db.invoices,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$InvoicesTableOrderingComposer(
            $db: $db,
            $table: $db.invoices,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$InvoiceLineItemsTableAnnotationComposer
    extends Composer<_$AppDatabase, $InvoiceLineItemsTable> {
  $$InvoiceLineItemsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<DateTime> get updatedAt =>
      $composableBuilder(column: $table.updatedAt, builder: (column) => column);

  GeneratedColumn<bool> get isSynced =>
      $composableBuilder(column: $table.isSynced, builder: (column) => column);

  GeneratedColumn<bool> get isDeleted =>
      $composableBuilder(column: $table.isDeleted, builder: (column) => column);

  GeneratedColumn<String> get itemId =>
      $composableBuilder(column: $table.itemId, builder: (column) => column);

  GeneratedColumn<String> get name =>
      $composableBuilder(column: $table.name, builder: (column) => column);

  GeneratedColumn<String> get description => $composableBuilder(
    column: $table.description,
    builder: (column) => column,
  );

  GeneratedColumn<double> get quantity =>
      $composableBuilder(column: $table.quantity, builder: (column) => column);

  GeneratedColumn<double> get unitPrice =>
      $composableBuilder(column: $table.unitPrice, builder: (column) => column);

  GeneratedColumn<double> get lineTotal =>
      $composableBuilder(column: $table.lineTotal, builder: (column) => column);

  $$InvoicesTableAnnotationComposer get invoiceId {
    final $$InvoicesTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.invoiceId,
      referencedTable: $db.invoices,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$InvoicesTableAnnotationComposer(
            $db: $db,
            $table: $db.invoices,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$InvoiceLineItemsTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $InvoiceLineItemsTable,
          InvoiceLineItem,
          $$InvoiceLineItemsTableFilterComposer,
          $$InvoiceLineItemsTableOrderingComposer,
          $$InvoiceLineItemsTableAnnotationComposer,
          $$InvoiceLineItemsTableCreateCompanionBuilder,
          $$InvoiceLineItemsTableUpdateCompanionBuilder,
          (InvoiceLineItem, $$InvoiceLineItemsTableReferences),
          InvoiceLineItem,
          PrefetchHooks Function({bool invoiceId})
        > {
  $$InvoiceLineItemsTableTableManager(
    _$AppDatabase db,
    $InvoiceLineItemsTable table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$InvoiceLineItemsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$InvoiceLineItemsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$InvoiceLineItemsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> id = const Value.absent(),
                Value<DateTime> updatedAt = const Value.absent(),
                Value<bool> isSynced = const Value.absent(),
                Value<bool> isDeleted = const Value.absent(),
                Value<String> invoiceId = const Value.absent(),
                Value<String?> itemId = const Value.absent(),
                Value<String> name = const Value.absent(),
                Value<String?> description = const Value.absent(),
                Value<double> quantity = const Value.absent(),
                Value<double> unitPrice = const Value.absent(),
                Value<double> lineTotal = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => InvoiceLineItemsCompanion(
                id: id,
                updatedAt: updatedAt,
                isSynced: isSynced,
                isDeleted: isDeleted,
                invoiceId: invoiceId,
                itemId: itemId,
                name: name,
                description: description,
                quantity: quantity,
                unitPrice: unitPrice,
                lineTotal: lineTotal,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                Value<String> id = const Value.absent(),
                Value<DateTime> updatedAt = const Value.absent(),
                Value<bool> isSynced = const Value.absent(),
                Value<bool> isDeleted = const Value.absent(),
                required String invoiceId,
                Value<String?> itemId = const Value.absent(),
                required String name,
                Value<String?> description = const Value.absent(),
                Value<double> quantity = const Value.absent(),
                Value<double> unitPrice = const Value.absent(),
                Value<double> lineTotal = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => InvoiceLineItemsCompanion.insert(
                id: id,
                updatedAt: updatedAt,
                isSynced: isSynced,
                isDeleted: isDeleted,
                invoiceId: invoiceId,
                itemId: itemId,
                name: name,
                description: description,
                quantity: quantity,
                unitPrice: unitPrice,
                lineTotal: lineTotal,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable(table),
                  $$InvoiceLineItemsTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback: ({invoiceId = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [],
              addJoins:
                  <
                    T extends TableManagerState<
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic
                    >
                  >(state) {
                    if (invoiceId) {
                      state =
                          state.withJoin(
                                currentTable: table,
                                currentColumn: table.invoiceId,
                                referencedTable:
                                    $$InvoiceLineItemsTableReferences
                                        ._invoiceIdTable(db),
                                referencedColumn:
                                    $$InvoiceLineItemsTableReferences
                                        ._invoiceIdTable(db)
                                        .id,
                              )
                              as T;
                    }

                    return state;
                  },
              getPrefetchedDataCallback: (items) async {
                return [];
              },
            );
          },
        ),
      );
}

typedef $$InvoiceLineItemsTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $InvoiceLineItemsTable,
      InvoiceLineItem,
      $$InvoiceLineItemsTableFilterComposer,
      $$InvoiceLineItemsTableOrderingComposer,
      $$InvoiceLineItemsTableAnnotationComposer,
      $$InvoiceLineItemsTableCreateCompanionBuilder,
      $$InvoiceLineItemsTableUpdateCompanionBuilder,
      (InvoiceLineItem, $$InvoiceLineItemsTableReferences),
      InvoiceLineItem,
      PrefetchHooks Function({bool invoiceId})
    >;

class $AppDatabaseManager {
  final _$AppDatabase _db;
  $AppDatabaseManager(this._db);
  $$BusinessProfileTableTableManager get businessProfile =>
      $$BusinessProfileTableTableManager(_db, _db.businessProfile);
  $$ClientsTableTableManager get clients =>
      $$ClientsTableTableManager(_db, _db.clients);
  $$ItemsTableTableManager get items =>
      $$ItemsTableTableManager(_db, _db.items);
  $$InvoicesTableTableManager get invoices =>
      $$InvoicesTableTableManager(_db, _db.invoices);
  $$InvoiceLineItemsTableTableManager get invoiceLineItems =>
      $$InvoiceLineItemsTableTableManager(_db, _db.invoiceLineItems);
}
