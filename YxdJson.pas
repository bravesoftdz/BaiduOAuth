{*******************************************************}
{                                                       }
{       YxdJSON Library                                 }
{                                                       }
{       ��Ȩ���� (C) 2016 YangYxd, Swish                }
{                                                       }
{*******************************************************}
{
 ----------------------------------------------------------------
  ˵��
 ----------------------------------------------------------------
  YXDJSON����swish��QJSON�޸ģ���лswish����лQJson
  QJson����QDAC��Ŀ����Ȩ��swish(QQ:109867294)����
  ��л���ѵ�֧�֣��ֺ롢è��
  QDAC�ٷ�Ⱥ��250530692
 
 --------------------------------------------------------------------
  ���¼�¼
 --------------------------------------------------------------------
 ver 1.0.24 2018.01.25
 --------------------------------------------------------------------
  * �޸���֪Bug
  
 --------------------------------------------------------------------
 ver 1.0.23 2017.12.18
 --------------------------------------------------------------------
  * �Ż� CatValue ���룬�������ToString����
  
 --------------------------------------------------------------------
 ver 1.0.22 2017.12.15
 --------------------------------------------------------------------
  * �����Ǹ�������
  * �޸� blob ��ع��ܣ�����AsBytes
  + ���ӱ��뿪�� USEBase64, �ڵͰ汾Delphi�У����Ҫʹ�õ��ļ�����Ҫ
    �ر���
  
 ver 1.0.21 2017.12.13
 --------------------------------------------------------------------
  + ���� blob ֧�֣�����ֱ���������Ϊ blob����

 ver 1.0.20 2017.11.15
 --------------------------------------------------------------------
  * �Ż�����ʱ�������RTTIת��������ʱ�����ù���

 --------------------------------------------------------------------
 ver 1.0.19 2017.10.17
 --------------------------------------------------------------------
  * ͬ�� qjson �޸�ParseJsonTime����bug
  
 ver 1.0.18 2017.08.30
 --------------------------------------------------------------------
  + ���� GetStringEx ����
  
 --------------------------------------------------------------------
 ver 1.0.17 2017.06.06
 --------------------------------------------------------------------
  + ���� Delphi 7 ֧��
  
 ver 1.0.16 2016.11.13
 --------------------------------------------------------------------
  + ���� Parser �ຯ���������Զ�����Json�ַ���ΪJSONObject��JSONArray.
  + ���� Serialize �ຯ��, ����ֱ�����л�������¼ΪJSON�ַ�����
  
 ver 1.0.15 2015.09.01
 --------------------------------------------------------------------
  + �������� SuperJSON ��ʹ�÷�ʽ
 
 ver 1.0.14 2015.07.15
 --------------------------------------------------------------------
  - ���� ParseObjectByName ������һ��BUG ��RE: ��ҹɱ�֣�

 ver 1.0.13 2015.06.09
 --------------------------------------------------------------------
  - ���� ParseStringByName ������һ��BUG ��RE: ��ҹɱ�֣�

 ver 1.0.11 2014.12.08
 --------------------------------------------------------------------
  - ����ParseNumeric�����ڽ�������ʱ��δ���м����ɽ����Ľ�����ַ�
    �����ʽ�����һ����ɵ�

 ver 1.0.10 2014.11.12
 --------------------------------------------------------------------
  - �Ľ�JSONBase��SetName�������Ľ�Put(Key, JSONObject/JSONArray)��
    ����Destroy���̣�ʵ�ֵ�JSONBase�޸�����ʱҲ��Ч

 ver 1.0.9  2014.11.08
 --------------------------------------------------------------------
  - �޸�ע�ʹ����BUG
  - �޸�XE��汾��δ����USERTTIѡ��ʱ���벻ͨ������
  - �Ľ�FloatToStr����
  - ��������IsJSONObject��IsJSONArray�����ж�JSONBase��JSON���������

 ver 1.0.8  2014.08.05
 --------------------------------------------------------------------
  - ���ĸ�ʽ��jdtObject�Ļ�������.
  - �Ż�������������Ļ�������ڵ�JsonObject���⡣
  - ֧��DataSet���л��뷴���л�������USEDBRTTI���뿪�ء�
  - ���������"@[����]�ʵ�XE��[����]�й�����"�����BUG.

 ver 1.0.6  2014.08.01
 --------------------------------------------------------------------
  - ���� RTTI ����֧�֣�����USERTTI����ѡ��(������YxdRtti��Ԫ)��
  - ��ƽ̨֧�֣�����FMX��ܣ�������֧��Win32, Android��
  - ����Copy, CopyIf, FindIf, DeleteIf, ForcePath, ItemByPath�Ⱥ�����
  - ֧��For..In���ܡ�
  - �����ຯ��ParseObject(TObject)��
  - ���getVariant���Ƿ��ز���NULL���⣨RE: �й����죩

 ver 1.0.5  2014.07.24
 --------------------------------------------------------------------
  - ���� Next ���������ظ��ڵ������ڵ���һ��JSONֵ
  - ���� JSONValue ����ֵ�͵Ĵ���ʽ�����put��������getFloat������
    ���⡣
  - ���� parseStringByName ����������ȡ��json�ַ�����ָ��
    key���ַ���ֵ
  - ���� parseObjectByName �ຯ������������json�ַ���

 ver 1.0.2  2014.07.15
 --------------------------------------------------------------------
  - �Ż������������� ^_^

 ver 1.0.1  2014.07.13
 --------------------------------------------------------------------
  - XE6֧��

 --------------------------------------------------------------------
}

unit YxdJson;

interface

{$IF RTLVersion>=24}
{$LEGACYIFEND ON}
{$IFEND}

{$IF defined(FPC)}
  {$DEFINE USEINLINE}
{$IFEND}
{$IF RTLVersion>=18}
  {$DEFINE USEINLINE}
{$IFEND}

{$ifdef VER150}
  {$define Version7}
  {$DEFINE JSON_SUPPORT}
{$endif}  

(* ���ܿ�ѡ���������� *)
{.$DEFINE USEYxdStr}    // �Ƿ�ʹ��YxdStr��Ԫ
{.$DEFINE USERTTI}      // �Ƿ�ʹ��RTTI����
{.$DEFINE USERegEx}     // �Ƿ�ʹ��������ʽ�������ܣ�D2010֮ǰ�汾��Ҫ������ص�Ԫ
{.$DEFINE USEBase64}    // �Ƿ�ʹ��Base64��Ԫ
{.$DEFINE USEPool}      // �Ƿ�ʹ�ó� (�����ʹ�ý��鿪��)

{$IFDEF USERTTI}
  {$DEFINE USEDBRTTI}    // �Ƿ�ʹ��DataSet���л����ܣ�����������USERTTI
{$ENDIF}

(* Delphi �汾������������ *)
//Delphi 2007
{$IFDEF VER185}
{$DEFINE JSON_SUPPORT}
{$ENDIF}                         

//Delphi XE
{$IFDEF VER220}
{$DEFINE JSON_SUPPORT}
{$DEFINE JSON_UNICODE}
{$IFDEF USERTTI}
{$DEFINE JSON_RTTI}
{$ENDIF}
{$ENDIF}

{$IFNDEF JSON_SUPPORT}
  {$IF CompilerVersion > 22}
    {$DEFINE JSON_SUPPORT}
    {$DEFINE JSON_UNICODE}
    {$IFDEF USERTTI}
      {$DEFINE JSON_RTTI}
      {$DEFINE JSON_RTTI_NAMEFIELD}
    {$ENDIF}
  {$IFEND}
{$ENDIF}

{$IFNDEF JSON_SUPPORT}
{$MESSAGE WARN '!!!JSON Only test in D7, 2007 and XE6,No support in other version!!!'}
{$ENDIF}

uses
  {$IFDEF USEYxdStr}YxdStr, {$ENDIF}
  {$IFNDEF JSON_UNICODE}Windows, {$ELSE} {$IFDEF MSWINDOWS}Windows, {$ENDIF}{$ENDIF}
  {$IFDEF USEDBRTTI}DB, {$ENDIF}
  {$IFDEF JSON_UNICODE}Generics.Collections, {$ENDIF}
  {$IFDEF USERTTI}{$IFDEF JSON_RTTI}{$IFDEF JSON_UNICODE}Rtti, {$ENDIF}{$ENDIF}TypInfo, {$ENDIF}
  {$IF (RTLVersion>=26) and (not Defined(NEXTGEN))}AnsiStrings, {$IFEND}
  {$IFDEF USERegEx}{$IF RTLVersion<22}{2007-2010}PerlRegEx, pcre, {$ELSE}RegularExpressionsCore, {$IFEND}{$ENDIF}
  {$IFNDEF USERTTI}
  {$IFDEF JSON_UNICODE}Soap.EncdDecd, {$ELSE}{$IFDEF USEBase64}Base64, {$ENDIF}{$ENDIF}
  {$IF CompilerVersion > 27}System.NetEncoding, {$IFEND}
  {$ENDIF}
  SysUtils, Classes, Variants, Math, DateUtils, SyncObjs;

type
  {$IFDEF JSON_UNICODE}
  JSONStringW = UnicodeString;
  JSONString = JSONStringW;
  {$ELSE}
  JSONStringW = WideString;
  {$ENDIF}
  {$IFNDEF USEYxdStr}{$IFDEF NEXTGEN}
  AnsiChar = Byte;
  PAnsiChar = ^AnsiChar;
  WideString = UnicodeString;
  AnsiString = record
  private
    FValue:TBytes;
    function GetChars(AIndex: Integer): AnsiChar;
    procedure SetChars(AIndex: Integer; const Value: AnsiChar);
    function GetLength:Integer;
    procedure SetLength(const Value: Integer);
    function GetIsUtf8: Boolean;
  public
    class operator Implicit(const S:WideString):AnsiString;
    class operator Implicit(const S:AnsiString):PAnsiChar;
    class operator Implicit(const S:AnsiString):TBytes;
    class operator Implicit(const ABytes:TBytes):AnsiString;
    class operator Implicit(const S:AnsiString):JSONStringW;
    //class operator Implicit(const S:PAnsiChar):AnsiString;
    //�ַ����Ƚ�
    procedure From(p:PAnsiChar;AOffset,ALen:Integer);
    property Chars[AIndex:Integer]:AnsiChar read GetChars write SetChars;default;
    property Length:Integer read GetLength write SetLength;
    property IsUtf8:Boolean read GetIsUtf8;
  end;
  {$ENDIF} {$ENDIF}
  JSONStringA = AnsiString;
  {$IFDEF JSON_UNICODE}
  JSONChar = WideChar;
  PJSONChar = PWideChar;
  {$IFNDEF USEYxdStr}
  TIntArray = TArray<Integer>;
  {$ENDIF}
  {$ELSE}
  JSONString = JSONStringA;
  JSONChar = AnsiChar;
  PJSONChar = PAnsiChar;
  {$IFNDEF USEYxdStr}
  TIntArray = array of Integer;
  IntPtr = Integer;
    {$IFNDEF USEINLINE}
    TBytes = array of Byte;
    {$ENDIF}
  {$ENDIF}
  {$ENDIF}

{$IFNDEF USEYxdStr}
type
  TTextEncoding = (teUnknown, {δ֪�ı���} teAuto,{�Զ����} teAnsi, { Ansi���� }
    teUnicode16LE, { Unicode LE ���� } teUnicode16BE, { Unicode BE ���� }
    teUTF8 { UTF8���� } );
{$ENDIF}

type
  JSONDataType = (jdtUnknown, jdtNull, jdtString, jdtInteger, jdtFloat,
    jdtBoolean, jdtDateTime, jdtObject, jdtBytes
  );

type
  TJsonDatePrecision = (jdpMillisecond, jdpSecond);
  // ����ʱ���ʽ����ʽ
  TJsonDateFormatStyle = (
    jdsNormal {��ͳ�������ʽ������JsonDateTimeFormat������������ַ���},
    jdsJsonTime {JSON��׼ʱ��������ʽ}
  );
  TJsonIntToTimeStyle = (tsDeny, tsSecondsFrom1970, tsSecondsFrom1899,
    tsMsFrom1970, tsMsFrom1899);
    
{$IFNDEF USEYxdStr}
type
  TStringCatHelper = class
  private
    FValue: array of JSONChar;
    FStart, FDest: PJSONChar;
    FBlockSize: Integer;
    FSize: Integer;
    function GetValue: JSONString;
    function GetPosition: Integer;
    function GetChars(AIndex:Integer): JSONChar;
    procedure SetPosition(const Value: Integer);
    procedure NeedSize(ASize:Integer);
    function GetLast: PJSONChar;
    function GetEndChar: PChar;
    procedure SetDest(const Value: PJSONChar);
  public
    constructor Create; overload;
    constructor Create(ASize: Integer); overload;
    destructor Destroy; override;
    procedure IncSize(const V: Integer);
    function Cat(p: PJSONChar; len: Integer): TStringCatHelper; overload;
    function Cat(const s: JSONString): TStringCatHelper; overload;
    function Cat(c: JSONChar): TStringCatHelper; overload;
    function Cat(const V:Int64): TStringCatHelper;overload;
    function Cat(const V:Double): TStringCatHelper;overload;
    function Cat(const V:Boolean): TStringCatHelper;overload;
    function Cat(const V:Currency): TStringCatHelper;overload;
    function Cat(const V:TGuid): TStringCatHelper;overload;
    function Cat(const V:Variant): TStringCatHelper;overload;
    function Space(count:Integer): TStringCatHelper;
    function Replicate(const V: string; Count: Integer = 1): TStringCatHelper;
    function Back(ALen: Integer): TStringCatHelper;
    function BackIf(const s: PJSONChar): TStringCatHelper;
    property Value: JSONString read GetValue;
    property Chars[Index: Integer]: JSONChar read GetChars;
    property Start: PJSONChar read FStart;
    property Last: PJSONChar read GetLast;
    property Current: PJSONChar read FDest write SetDest;
    property EndChar: PChar read GetEndChar;
    property Position: Integer read GetPosition write SetPosition;
  end;
{$ENDIF}

type
  JSONBase = class;
  JSONObject = class;
  JSONArray = class;

  /// <summary>
  /// JSON�ڵ�
  /// </summary>
  PJSONValue = ^JSONValue;
  JSONValue = {$IFNDEF USEINLINE}object{$ELSE}packed record{$ENDIF}
  private
    FObject: JSONBase;
    function GetAsBoolean: Boolean;
    function GetAsByte: Byte;
    function GetAsDouble: Double;
    function GetAsFloat: Extended;
    function GetAsInt64: Int64;
    function GetAsInteger: Integer;
    function GetAsJSONArray: JSONArray;
    function GetAsJSONObject: JSONObject;
    function GetAsString: JSONString;
    function GetAsVariant: Variant;
    function GetAsWord: Word;
    procedure SetAsBoolean(const Value: Boolean);
    procedure SetAsByte(const Value: Byte);
    procedure SetAsDouble(const Value: Double);
    procedure SetAsFloat(const Value: Extended);
    procedure SetAsInt64(const Value: Int64);
    procedure SetAsInteger(const Value: Integer);
    procedure SetAsJSONArray(const Value: JSONArray);
    procedure SetAsJSONObject(const Value: JSONObject);
    procedure SetAsString(const Value: JSONString);
    procedure SetAsVariant(const Value: Variant);
    procedure SetAsWord(const Value: Word);
    function GetAsDateTime: TDateTime;
    procedure SetAsDateTime(const Value: TDateTime);
    function GetSize: Cardinal;
    procedure Free();
    procedure SetAsDWORD(const Value: Cardinal);
    function GetIsDateTime: Boolean;
    function GetAsStream: TStream;
    procedure SetAsStream(const Value: TStream);
    function GetIsBlob: Boolean;
    procedure SetAsBytes(const Value: TBytes);
  public
    FType: JSONDataType;
    FName: JSONString;
    FNameHash: Cardinal;
    FValue: TBytes;

    procedure Clear();

    function ToString: JSONString; overload;
    function ToString(AIndent: Integer; ADoEscape: Boolean = False): JSONString; overload;
    function GetPath(const ADelimiter: JSONChar = '.'): JSONString;
    function GetObject: JSONBase;
    function GetString: string;
    function GetStringEx(AEncoding: TTextEncoding = teUnknown): string;
    {$IFDEF JSON_RTTI}
    // ����ǰjson����ת��ΪTValue���͵�ֵ
    function ToObjectValue: TValue;
    {$ENDIF}
    procedure CopyValue(ASource: PJSONValue); {$IFDEF USEINLINE}inline;{$ENDIF}

    /// <summary>
    /// ��Variant�ֽ������ΪBlob��
    /// </summary>
    procedure SetVariantToStream(const Value: Variant);
    function GetVariantFormStream(): Variant;

    /// <summary>
    /// ����Blob�ַ���
    /// </summary>
    function ParseBlobData(): Boolean;

    procedure SetBytes(const Data: Pointer; ASize: NativeInt); overload;
    procedure SetBytes(Source: TStream; IsAll: Boolean = True); overload;

    function TryAsDatetime(const DefaultValue: TDateTime = 0): TDateTime;

    property IsDateTime: Boolean read GetIsDateTime;
    property IsBlob: Boolean read GetIsBlob;

    property AsBoolean: Boolean read GetAsBoolean write SetAsBoolean;
    property AsByte: Byte read GetAsByte write SetAsByte;
    property AsWord: Word read GetAsWord write SetAsWord;
    property AsInteger: Integer read GetAsInteger write SetAsInteger;
    property AsInt64: Int64 read GetAsInt64 write SetAsInt64;
    property AsFloat: Extended read GetAsFloat write SetAsFloat;
    property AsDouble: Double read GetAsDouble write SetAsDouble;
    property AsDateTime: TDateTime read GetAsDateTime write SetAsDateTime;
    property AsString: JSONString read GetAsString write SetAsString;
    property AsVariant: Variant read GetAsVariant write SetAsVariant; // ��֧�ֳ�������
    property AsJsonObject: JSONObject read GetAsJSONObject write SetAsJSONObject;
    property AsJsonArray: JSONArray read GetAsJSONArray write SetAsJSONArray;
    property AsStream: TStream read GetAsStream write SetAsStream; // ע�⣬���ص�����Ҫ�ͷ�
    property AsBytes: TBytes read FValue write SetAsBytes;
    property Size: Cardinal read GetSize;
  end;

  JSONEnumerator = class
  private
    FIndex: Integer;
    FList: JSONBase;
  public
    constructor Create(AList: JSONBase);
    function GetCurrent: PJSONValue; {$IFDEF USEINLINE}inline;{$ENDIF}
    function MoveNext: Boolean;
    property Current: PJSONValue read GetCurrent;
  end;

  {$IFDEF UNICODE}
  JSONList = TList<PJSONValue>;
  {$ELSE}
  JSONList = class(TList)
  protected
    function Get(Index: Integer): PJSONValue; {$IFDEF USEINLINE}inline;{$ENDIF}
    procedure Put(Index: Integer; Item: PJSONValue); {$IFDEF USEINLINE}inline;{$ENDIF}
  public
    property Items[Index: Integer]: PJSONValue read Get write Put; default;  
  end;
  {$ENDIF}
  
  {$IFDEF UNICODE}
  /// <summary>
  /// �����˴�����������XE6��֧����������
  /// </summary>
  /// <param name="ASender">�����¼���TQJson����</param>
  /// <param name="AItem">Ҫ���˵Ķ���</param>
  /// <param name="Accept">�Ƿ�Ҫ����ö���</param>
  /// <param name="ATag">�û����ӵ�������</param>
  JSONFilterEventA = reference to procedure(ASender: JSONBase; AItem: PJSONValue;
    var Accept: Boolean; ATag: Pointer);
  {$ENDIF}
  /// <summary>
  /// �����˴�����������XE6��֧����������
  /// </summary>
  /// <param name="ASender">�����¼���TQJson����</param>
  /// <param name="AItem">Ҫ���˵Ķ���</param>
  /// <param name="Accept">�Ƿ�Ҫ����ö���</param>
  /// <param name="ATag">�û����ӵ�������</param>
  JSONFilterEvent = procedure(ASender: JSONBase; AItem: PJSONValue;
    var Accept: Boolean; ATag: Pointer) of object;
    
  JSONBase = class(TObject)
  private
    FParent: JSONBase;
    FItems: JSONList;
    FData: Pointer;
    FValue: PJSONValue; // FParent��Ϊnilʱ, FValue�ض���Ϊnil
    function GetItemIndex: Integer;
    function GetValue: JSONString;
    procedure SetValue(const Value: JSONString);
    function GetName: JSONString;
    procedure SetName(const Value: JSONString);
    procedure RemoveObject(obj: JSONBase);
    function FormatParseError(ACode: Integer; AMsg: JSONString; ps,p:PJSONChar): JSONString;
    procedure RaiseParseException(ACode: Integer; ps, p: PJSONChar);
    function GetIsJSONArray: Boolean;
    function GetIsJSONObject: Boolean;
    function GetPathPro: JSONString; overload;

    //�¼�һ����JSON����
    function NewChildObject(const key: JSONString): JSONObject; //inline;
    //�¼�һ����JSON����
    function NewChildArray(const key: JSONString): JSONArray; //inline;
  protected
    function GetIsArray: Boolean; virtual;
    function GetCount: Integer; virtual;
    function GetItems(Index: Integer): PJSONValue; virtual;
    class function InternalEncode(Obj: JSONBase; ABuilder: TStringCatHelper; AIndent: Integer; ADoEscape: Boolean): TStringCatHelper;
    /// <summary>����JSON����Ϊ�ַ���</summary>
    /// <param name="ADoFormat">�Ƿ��ʽ���ַ����������ӿɶ���</param>
    /// <param name="AIndent">ADoFormat����ΪTrueʱ��������С</param>
    /// <returns>���ر������ַ���</returns>
    class function Encode(Obj: JSONBase; AIndent: Integer = 0; ADoEscape: Boolean = True): JSONString; overload;
    procedure DecodeObject(var p: PJSONChar);
    function ParseJsonPair(ABuilder: TStringCatHelper; var p: PJSONChar): Integer;
    class function ParseValue(ABuilder: TStringCatHelper; var p: PJSONChar): Variant; overload;
    function ParseValue(ABuilder: TStringCatHelper; var p: PJSONChar;
      const FName: JSONString): Integer; overload;
    class procedure BuildJsonString(ABuilder: TStringCatHelper; var p: PJSONChar); overload;
    {$IFDEF JSON_UNICODE}
    class function CharUnescape(var p: PJSONChar): JSONChar;
    {$ELSE}
    class procedure CharUnescape(ABuilder: TStringCatHelper; var p: PJSONChar);
    {$ENDIF}
  public
    constructor Create; virtual;
    destructor Destroy; override;
    procedure Clear(); virtual;

    // Jaon��Key�Ƿ��Сд����
    class procedure SetJsonCaseSensitive(v: Boolean);

    function TryParse(const text: JSONString): Boolean; overload;
    function TryParse(p: PJSONChar; len: Integer = -1): Boolean; overload;
    
    /// <summary>
    /// �����ַ����� IgnoreZero Ϊ Trueʱ����Դ�ַ����е� #0 תΪ #32 ���ٽ���
    /// </summary>
    function Parse(const text: JSONString; IgnoreZero: Boolean = False): Boolean; overload;
    function Parse(p: PJSONChar; len: Integer = -1): Boolean; overload; virtual;
    {$IFDEF JSON_UNICODE}
    function ToString: JSONString; overload; override;
    {$ENDIF}
    function ToString(AIndent: Integer{$IFNDEF JSON_UNICODE} = 0{$ENDIF}; ADoEscape: Boolean = False): JSONString; {$IFDEF JSON_UNICODE}reintroduce; overload;{$ENDIF}
    procedure Assign(ANode: JSONBase);

    /// <summary>��ȡfor..in��Ҫ��GetEnumerator֧��</summary>
    function GetEnumerator: JSONEnumerator;
    /// <summary>��ȡ��ǰ�ڵ��·��</summary>
    function GetPath(const ADelimiter: JSONChar = '\'): JSONString; overload;
    /// <summary>����JSON����Ϊ�ַ���, ��toString��ͬ</summary>
    /// <param name="AIndent">������λ��С</param>
    /// <param name="ADoEscape">�Ƿ�ת�����ĸ�������ַ�</param>
    function Encode(AIndent: Integer; ADoEscape: Boolean = False): JSONString; overload; virtual;
    /// <summary>����ָ����JSON�ַ���</summary>
    /// <param name="s">Ҫ������JSON�ַ���</param>
    procedure Decode(const s: JSONString); overload;
    /// <summary>����ָ����JSON�ַ���</summary>
    /// <param name="p">Ҫ�������ַ���</param>
    /// <param name="len">�ַ������ȣ�<=0��Ϊ����\0(#0)��β��C���Ա�׼�ַ���</param>
    procedure Decode(p: PJSONChar; len: Integer = -1); overload;

    /// <summary>���浱ǰ�������ݵ�����</summary>
    ///  <param name="AStream">Ŀ��������</param>
    ///  <param name="AEncoding">�����ʽ</param>
    ///  <param name="AWriteBom">�Ƿ�д��BOM</param>
    ///  <remarks>ע�⵱ǰ�������Ʋ��ᱻд��</remarks>
    procedure SaveToStream(AStream: TStream; AIndent: Integer; AEncoding: TTextEncoding; AWriteBOM: Boolean; ADoEscape: Boolean = False); overload;
    procedure SaveToStream(AStream: TStream; AIndent: Integer = 0; ADoEscape: Boolean = False); overload;
    /// <summary>�����ĵ�ǰλ�ÿ�ʼ����JSON����</summary>
    ///  <param name="AStream">Դ������</param>
    ///  <param name="AEncoding">Դ�ļ����룬���ΪteUnknown�����Զ��ж�</param>
    ///  <remarks>���ĵ�ǰλ�õ������ĳ��ȱ������2�ֽڣ�����������</remarks>
    procedure LoadFromStream(AStream: TStream; AEncoding: TTextEncoding=teUnknown);
    /// <summary>���浱ǰ�������ݵ��ļ���</summary>
    ///  <param name="AFileName">�ļ���</param>
    ///  <param name="AEncoding">�����ʽ</param>
    ///  <param name="AWriteBOM">�Ƿ�д��UTF-8��BOM</param>
    ///  <remarks>ע�⵱ǰ�������Ʋ��ᱻд��</remarks>
    procedure SaveToFile(const AFileName: JSONString; AIndent: Integer = 0); overload;
    procedure SaveToFile(const AFileName: JSONString; AIndent: Integer; AEncoding: TTextEncoding; AWriteBOM: Boolean = True); overload;
    /// <summary>��ָ�����ļ��м��ص�ǰ����</summary>
    ///  <param name="AFileName">Ҫ���ص��ļ���</param>
    ///  <param name="AEncoding">Դ�ļ����룬���ΪteUnknown�����Զ��ж�</param>
    procedure LoadFromFile(const AFileName: JSONString; AEncoding: TTextEncoding=teUnknown);

    procedure Remove(Index: Integer); virtual;

    //��һ��
    function Next: PJSONValue;

    /// <summary>����ָ�����ƵĽ�������</summary>
    /// <param name="AName">Ҫ���ҵĽ������</param>
    /// <returns>��������ֵ��δ�ҵ�����-1</returns>
    function IndexOf(const Key: JSONString): Integer; virtual;
    /// <summary>�ж�ָ�����ƵĽ���Ƿ����</summary>
    /// <param name="AName">�������</param>
    function Exist(const Key: JSONString): Boolean;
    {$IFDEF UNICODE}
    /// <summary>���������ҷ��������Ľ��</summary>
    /// <param name="ATag">�û��Զ���ĸ��Ӷ�����</param>
    /// <param name="ANest">�Ƿ�Ƕ�׵��ã����Ϊfalse����ֻ�Ե�ǰ�ӽ�����</param>
    /// <param name="AFilter">���˻ص����������Ϊnil���򷵻�nil</param>
    function FindIf(const ATag: Pointer; ANest: Boolean; AFilter: JSONFilterEventA): PJSONValue; overload;
    {$ENDIF UNICODE}
    /// <summary>���������ҷ��������Ľ��</summary>
    /// <param name="ATag">�û��Զ���ĸ��Ӷ�����</param>
    /// <param name="ANest">�Ƿ�Ƕ�׵��ã����Ϊfalse����ֻ�Ե�ǰ�ӽ�����</param>
    /// <param name="AFilter">���˻ص����������Ϊnil���򷵻�nil</param>
    function FindIf(const ATag: Pointer; ANest: Boolean; AFilter: JSONFilterEvent): PJSONValue; overload;
    /// <summary>��������һ���µ�ʵ��</summary>
    /// <returns>�����µĿ���ʵ��</returns>
    /// <remarks>��Ϊ�ǿ����������¾ɶ���֮������ݱ��û���κι�ϵ����������һ��
    /// ���󣬲��������һ���������Ӱ�졣
    /// </remarks>
    function Copy: JSONBase;
    {$IFDEF UNICODE}
    /// <summary>��������һ���µ�ʵ��</summary>
    /// <param name="ATag">�û����ӵı�ǩ����</param>
    /// <param name="AFilter">�û������¼������ڿ���Ҫ����������</param>
    /// <returns>�����µĿ���ʵ��</returns>
    /// <remarks>��Ϊ�ǿ����������¾ɶ���֮������ݱ��û���κι�ϵ����������һ��
    /// ���󣬲��������һ���������Ӱ�졣
    /// </remarks>
    function CopyIf(const ATag: Pointer; AFilter: JSONFilterEventA): JSONBase; overload;
    {$ENDIF UNICODE}
    /// <summary>��������һ���µ�ʵ��</summary>
    /// <param name="ATag">�û����ӵı�ǩ����</param>
    /// <param name="AFilter">�û������¼������ڿ���Ҫ����������</param>
    /// <returns>�����µĿ���ʵ��</returns>
    /// <remarks>��Ϊ�ǿ����������¾ɶ���֮������ݱ��û���κι�ϵ����������һ��
    /// ���󣬲��������һ���������Ӱ�졣
    /// </remarks>
    function CopyIf(const ATag: Pointer; AFilter: JSONFilterEvent): JSONBase; overload;
    {$IFDEF UNICODE}
    /// <summary>
    /// ɾ�������������ӽ��
    /// </summary>
    /// <param name="ATag">�û��Լ����ӵĶ�����</param>
    /// <param name="ANest">�Ƿ�Ƕ�׵��ã����Ϊfalse����ֻ�Ե�ǰ�ӽ�����</param>
    /// <param name="AFilter">���˻ص����������Ϊnil���ȼ���Clear</param>
    procedure DeleteIf(const ATag: Pointer; ANest: Boolean; AFilter: JSONFilterEventA); overload;
    {$ENDIF UNICODE}
    /// <summary>
    /// ɾ�������������ӽ��
    /// </summary>
    /// <param name="ATag">�û��Լ����ӵĶ�����</param>
    /// <param name="ANest">�Ƿ�Ƕ�׵��ã����Ϊfalse����ֻ�Ե�ǰ�ӽ�����</param>
    /// <param name="AFilter">���˻ص����������Ϊnil���ȼ���Clear</param>
    procedure DeleteIf(const ATag: Pointer; ANest: Boolean; AFilter: JSONFilterEvent); overload;

    // ����ָ����JSON�ַ���
    class function Parser(const Text: JSONString; RaiseError: Boolean = True): JSONBase; overload;
    class function Parser(const AStream: TStream; RaiseError: Boolean = True): JSONBase; overload;
    class function Parser(P: PJSONChar; Len: Integer = -1; RaiseError: Boolean = True): JSONBase; overload;
    // ����ָ����JSON�ַ���
    class function ParseObject(const Text: JSONString; RaiseError: Boolean = True): JSONObject; overload;
    // ����ָ����JSON�ַ���
    class function ParseArray(const Text: JSONString; RaiseError: Boolean = True): JSONArray; overload;
    class procedure CatJson(ABuilder: TStringCatHelper; const AValue: JSONString; ADoEscape: Boolean);

    /// <summary>
    /// ���л�
    /// </summary>
    {$IFDEF USERTTI}
    class function Serialize(ASource: TObject): JSONString; overload;
    class function Serialize(ASource: Pointer; AType: PTypeInfo): JSONString; overload;
    class function GetSerializeWriter(): TObject;
    {$ENDIF}
    {$IFDEF USEDBRTTI}
    class function Serialize(ADataSet: TDataSet; const PageIndex: Integer = 0;
      const PageSize: Integer = 0; Base64Blob: Boolean = True): JSONString; overload;
    {$ENDIF}
    {$IFDEF JSON_RTTI}
    class function Serialize(AInstance: TValue): JSONString; overload;
    class function Serialize<T>(AInstance: T): JSONString; overload;
    {$ENDIF}

    /// <summary>
    /// ǿ��һ��·������,���������,�����δ�����Ҫ�Ľ��
    /// <returns>����·����Ӧ�Ķ���</returns>
    /// <remarks>
    /// ��������·����ȫ�����ڣ���ForcePath�ᰴ���¹���ִ��:
    /// 1�����APath�а���[]������Ϊ��Ӧ��·�����Ϊ���飬ʾ�����£�
    /// (1)��'a.b[].name'��
    /// a -> jdtObject
    /// b -> jdtArray
    /// b[0].name -> jdtNull(b������δָ�����Զ���Ϊ��b[0]
    /// 2��·���ָ���./\�ǵȼ۵ģ����ҽ�������в�Ӧ�������������ַ�֮һ,����
    /// 3�����APathָ���Ķ������Ͳ�ƥ�䣬����׳��쳣����aΪ���󣬵�ʹ��a[0].b����ʱ��
    /// </remarks>
    /// </summary>
    function ForcePath(const APath: JSONString; const ADelimiter: JSONChar = '.'): PJSONValue;
    /// <summary>��ȡָ��·����JSON����</summary>
    /// <param name="APath">·��</param>
    /// <param name="ADelimiter">·���ָ�����Ĭ��ʹ��"."</param>
    /// <returns>�����ҵ����ӽ�㣬���δ�ҵ�����NULL(nil)</returns>
    function ItemByPath(const APath: JSONString; const ADelimiter: JSONChar = '.'): PJSONValue;
    {$IFDEF USERegEx}
    /// <summary>��ȡ����ָ�����ƹ���Ľ�㵽�б���</summary>
    /// <param name="ARegex">������ʽ</param>
    /// <param name="AList">���ڱ�������б����</param>
    /// <param name="ANest">�Ƿ�ݹ�����ӽ��</param>
    /// <returns>�����ҵ��Ľ�����������δ�ҵ�������0</returns>
    function ItemByRegex(const ARegex: JSONString; AList: JSONList;
      ANest: Boolean = False): Integer; overload;
    {$ENDIF}
    
    {$IFDEF USERTTI}
    // ����ǰjson�������õ�ָ���Ķ���ʵ����
    procedure ToObjectValue(ADest: Pointer; AType: PTypeInfo); overload;
    // ����ǰjson�������õ�ָ���Ķ���ʵ����
    procedure ToObject(ADest: TObject);
    // ��ָ������Դ��ַ���������ݼ���json��
    procedure PutObjectValue(const Key: JSONString; ASource: Pointer; AType: PTypeInfo); overload;
    // ��ָ���Ķ���ʵ������json��
    procedure PutObject(const Key: JSONString; ASource: TObject);
    {$ENDIF}
    {$IFDEF USEDBRTTI}
    /// <summary>
    /// ��ָ�������ݼ�����ʵ�����ݼ���json��
    /// </summary>
    procedure PutDataSet(const Key: JSONString; aIn: TDataSet); overload;
    /// <summary>
    /// ��ָ�������ݼ�����ʵ�����ݼ���json��
    /// <param name="Key">���Key��Ϊ�գ�����Aout����һ����Key�������Ӷ������</param>
    /// <param name="aIn">�����л���DataSet���ݼ�</param>
    /// <param name="PageIndex">�ӵڼ�ҳ��ʼ���л���PageSize > 0 ʱ��Ч��</param>
    /// <param name="PageSize">��ҳʱÿҳ������</param>
    /// <param name="ArgsFields">���л�ָ�����ֶΡ������Ϊ�գ���ֻ���л�ArgsFieldsָ����ͬ���ֶ�</param>
    /// </summary>
    procedure PutDataSet(const Key: JSONString; aIn: TDataSet;
      const PageIndex, PageSize: Integer; Base64Blob: Boolean = True); overload;
    /// <summary>
    /// ����ǰjson����ת����DataSet�У�����ת���ɹ�����������
    /// </summary>
    function ToDataSet(aOut: TDataSet): Integer;
    {$ENDIF}
    {$IFDEF JSON_RTTI}
    // ����ǰjson�������õ�AInstanceָ������Դ��ַ������������
    procedure ToObjectValue(AInstance: TValue); overload;
    // ����ǰjson����ת��ΪTValue���͵�ֵ
    function ToObjectValue(): TValue; overload;
    // ����ǰjson�������õ�ָ���ļ�¼ʵ����
    procedure ToRecord<T>(out AInstance: T);
    // ��ָ����RTTIʵ������json��
    procedure PutObjectValue(const Key: JSONString; AInstance: TValue); overload;
    // ��ָ���ļ�¼ʵ������json��
    procedure PutRecord<T>(const Key: JSONString; const ASource: T);
    /// <summary>ʹ�õ�ǰJson�����������ָ���������Ӧ����</summary>
    /// <param name="AInstance">�����������Ķ���ʵ��</param>
    /// <returns>���غ������õĽ��</returns>
    /// <remarks>��������Ϊ��ǰ������ƣ������Ĳ����������ӽ�������Ҫ����һ��</remarks>
    function Invoke(AInstance: TValue): TValue;
    {$ENDIF}

    // ���JSON�ַ����������Զ�����
    procedure PutJSON(const Key, Value: JSONString; AType: JsonDataType = jdtUnknown);

    //�����
    property Parent: JSONBase read FParent;
    //�ӽ���ֵ
    property Value: JSONString read GetValue write SetValue;
    //����·����·���м���"\"�ָ�
    property Path: JSONString read GetPathPro;
    //�ڸ�����е�����˳�򣬴�0��ʼ�������-1��������Լ��Ǹ����
    property ItemIndex: Integer read GetItemIndex;
    //�ڵ�����(û�и��ڵ��������ƺ���Ч)
    property Name: JSONString read GetName write SetName;
    //����ĸ������ݳ�Ա�����û�������������
    property Data: Pointer read FData write FData;
    //�ӽ������
    property Count: Integer read GetCount;
    //��ȡһ���ӽڵ�
    property Items[Index: Integer]: PJSONValue read GetItems; default;
    //�ж��Ƿ���JSONObject����
    property IsJSONObject: Boolean read GetIsJSONObject;
    //�ж��Ƿ���JSONArray����
    property IsJSONArray: Boolean read GetIsJSONArray;
  end;

  JSONObject = class(JSONBase)
  private
    function GetChildItem(const Key: JSONString): PJSONValue;
    function GetChildForceItem(const Path: JSONString): PJSONValue;
  protected
    procedure Put(const Key: JSONString; ABuilder: TStringCatHelper); overload;
  public
    function Add(const Key: JSONString): PJSONValue;
    procedure Put(const Key: JSONString; Value: Boolean); overload;
    procedure Put(const Key: JSONString; Value: Integer); overload;
    procedure Put(const Key: JSONString; Value: Word); overload;
    procedure Put(const Key: JSONString; Value: Cardinal); overload;
    procedure Put(const Key: JSONString; Value: Byte); overload;
    procedure Put(const Key: JSONString; const Value: JSONString); overload;
    procedure Put(const Key: JSONString; const Value: Int64); overload;
    procedure Put(const Key: JSONString; const Value: Extended); overload;
    procedure Put(const Key: JSONString; const Value: Double); overload;
    procedure Put(const Key: JSONString; const Value: Variant); overload;
    procedure Put(const Key: JSONString; Value: JSONObject); overload;
    procedure Put(const Key: JSONString; Value: JSONArray); overload;
    procedure Put(const Key: JSONString; Value: TStream); overload;
    procedure Put(const Key: JSONString; const Value: TBytes); overload;
    procedure Put(const Key: JSONString; Value: array of const); overload;
    procedure PutDateTime(const Key: JSONString; Value: TDateTime);

    procedure Delete(const Key: JSONString);
    function Clone: JSONObject;

    function NextAsJsonObject: JSONObject;     

    /// <summary>
    /// ������text�а���ָ����key��value���Ӷ���, valueΪ��ʱ��ֻ�ж�key
    /// </summary>
    class function ParseObjectByName(const Text, Key: JSONString; Value: Variant): JSONObject;
    /// <summary>
    /// ������text��ָ��key��json��������Stringֵ
    /// </summary>
    class function ParseStringByName(const Text, Key: JSONString): JSONString;
    {$IFDEF USERTTI}
    /// <summary>
    /// ����һ���µ�JSONObject, ��ָ���Ķ���ʵ�����ݼ��뵱��
    /// </summary>
    class function ParseObject(const aIn: TObject): JSONObject; overload;
    {$ENDIF}

    function AddChildObject(const Key: JSONString): JSONObject;
    function AddChildArray(const Key: JSONString): JSONArray; overload;
    function AddChildArray(const Key: JSONString; AItems: array of const): JSONArray; overload;

    function GetItem(const Key: JSONString): PJSONValue;
    function GetByte(const Key: JSONString): Byte;
    function GetBoolean(const Key: JSONString): Boolean;
    function GetInt(const Key: JSONString): Integer;
    function GetInt64(const Key: JSONString): Int64;
    function GetWord(const Key: JSONString): Word;
    function GetDWORD(const Key: JSONString): Cardinal;
    function GetFloat(const Key: JSONString): Extended;
    function GetDouble(const Key: JSONString): Double;
    function GetString(const Key: JSONString): JSONString;
    function GetDateTime(const Key: JSONString): TDateTime;
    function GetVariant(const Key: JSONString): Variant;
    function GetJsonObject(const Key: JSONString): JSONObject;
    function GetJsonArray(const Key: JSONString): JSONArray;
    function GetStream(const Key: JSONString): TStream;  // ���ص�����Ҫ�ֶ��ͷ�
    function GetBytes(const Key: JSONString): TBytes;

    procedure SetByte(const Key: JSONString; Value: Byte);
    procedure SetBoolean(const Key: JSONString; const Value: Boolean);
    procedure SetDouble(const Key: JSONString; const Value: Double);
    procedure SetInt64(const Key: JSONString; const Value: Int64);
    procedure SetInt(const Key: JSONString; const Value: Integer);
    procedure SetWord(const Key: JSONString; const Value: Word);
    procedure SetDWORD(const Key: JSONString; const Value: Cardinal);
    procedure SetJsonArray(const Key: JSONString; const Value: JSONArray);
    procedure SetJsonObject(const Key: JSONString; const Value: JSONObject);
    procedure SetString(const Key, Value: JSONString);
    procedure SetVariant(const Key: JSONString; const Value: Variant);
    procedure SetDateTime(const Key: JSONString; const Value: TDateTime);
    procedure SetStream(const Key: JSONString; const Value: TStream);
    procedure SetBytes(const Key: JSONString; const Value: TBytes);

    // SuperJson �ӿ�
    function Contains(const Key: JSONString): Boolean; {$IFDEF USEINLINE}inline;{$ENDIF}
    
    property S[const Key: JSONString]: JSONString read GetString write SetString;
    property I[const Key: JSONString]: Int64 read GetInt64 write SetInt64;
    property B[const Key: JSONString]: Boolean read GetBoolean write SetBoolean;
    property F[const Key: JSONString]: Double read GetDouble write SetDouble;
    property O[const Key: JSONString]: JSONObject read GetJsonObject write SetJsonObject;
    property A[const Key: JSONString]: JSONArray read GetJsonArray write SetJsonArray;
    property V[const Key: JSONString]: Variant read GetVariant write SetVariant;
    property T[const Key: JSONString]: TDateTime read GetDateTime write SetDateTime;

    property Stream[const Key: JSONString]: TStream read GetStream write SetStream;
    property Bytes[const Key: JSONString]: TBytes read GetBytes write SetBytes;

    // ������ʱ���Զ����
    property Child[const Key: JSONString]: PJSONValue read GetChildItem; 
    // Path����������Key��Ҳ������һ����"."�ָ���·������ǿ�ƴ��ڣ��Ѵ��ڵ����Ͳ���ʱ���׳��쳣��
    property ChildForce[const Path: JSONString]: PJSONValue read GetChildForceItem; default;
  end;

  JSONArray = class(JSONBase)
  private
    function NewJsonValue(): PJSONValue; {$IFDEF USEINLINE}inline;{$ENDIF}
  protected
    function GetIsArray: Boolean; override;
  public
    procedure AddNull();
    procedure Add(Value: Boolean); overload;
    procedure Add(Value: Integer); overload;
    procedure Add(Value: Word); overload;
    procedure Add(Value: Cardinal); overload;
    procedure Add(Value: Byte); overload;
    procedure Add(const Value: JSONString); overload;
    procedure Add(const Value: Int64); overload;
    procedure Add(const Value: Extended); overload;
    procedure Add(const Value: Double); overload;
    procedure Add(const Value: Variant); overload;
    procedure Add(const Value: array of const); overload;
    procedure Add(Value: JSONObject); overload;
    procedure Add(Value: JSONArray); overload;
    procedure Add(Value: TStream); overload;
    procedure Add(const Value: TBytes); overload;
    procedure AddDateTime(Value: TDateTime);
    // ���JSON�ַ����������Զ�����
    procedure AddJSON(const Value: JSONString; AType: JsonDataType = jdtUnknown); overload;
    {$IFDEF JSON_RTTI}
    // ��ָ���Ķ���ʵ������json��
    procedure PutObject(ASource: TObject);
    // ��ָ���ļ�¼ʵ������json��
    procedure PutRecord<T>(const ASource: T);
    {$ENDIF}

    function Clone: JSONArray;
    function AddChildObject(): JSONObject; overload;
    function AddChildObject(const Index: Integer): JSONObject; overload;
    function AddChildArray(): JSONArray; overload;
    function AddChildArray(const Index: Integer): JSONArray; overload;

    function NextAsJsonArray: JSONArray;

    function GetByte(Index: Integer): Byte;
    function GetBoolean(Index: Integer): Boolean;
    function GetInt(Index: Integer): Integer;
    function GetInt64(Index: Integer): Int64;
    function GetWord(Index: Integer): Word;
    function GetDWORD(Index: Integer): Cardinal;
    function GetFloat(Index: Integer): Extended;
    function GetDouble(Index: Integer): Double;
    function GetString(Index: Integer): JSONString;
    function GetDateTime(Index: Integer): TDateTime;
    function GetVariant(Index: Integer): Variant;
    function GetJsonObject(Index: Integer): JSONObject;
    function GetJsonArray(Index: Integer): JSONArray;
    function GetStream(Index: Integer): TStream; // ���ص�����Ҫ�ֶ��ͷ�
    function GetBytes(Index: Integer): TBytes;

    procedure SetByte(Index: Integer; const Value: Byte);
    procedure SetBoolean(Index: Integer; const Value: Boolean);
    procedure SetDouble(Index: Integer; const Value: Double);
    procedure SetInt(Index: Integer; const Value: Integer);
    procedure SetWord(Index: Integer; const Value: Word);
    procedure SetDWORD(Index: Integer; const Value: Cardinal);
    procedure SetInt64(Index: Integer; const Value: Int64);
    procedure SetDateTime(Index: Integer; const Value: TDateTime);
    procedure SetJsonArray(Index: Integer; const Value: JSONArray);
    procedure SetJsonObject(Index: Integer; const Value: JSONObject);
    procedure SetString(Index: Integer; const Value: JSONString);
    procedure SetVariant(Index: Integer; const Value: Variant);
    procedure SetStream(Index: Integer; Value: TStream);
    procedure SetBytes(Index: Integer; const Value: TBytes);

    property S[Index: Integer]: JSONString read GetString write SetString;
    property I[Index: Integer]: Int64 read GetInt64 write SetInt64;
    property B[Index: Integer]: Boolean read GetBoolean write SetBoolean;
    property F[Index: Integer]: Double read GetDouble write SetDouble;
    property O[Index: Integer]: JSONObject read GetJsonObject write SetJsonObject;
    property A[Index: Integer]: JSONArray read GetJsonArray write SetJsonArray;
    property V[Index: Integer]: Variant read GetVariant write SetVariant;
    property T[Index: Integer]: TDateTime read GetDateTime write SetDateTime;

    property Stream[Index: Integer]: TStream read GetStream write SetStream;
    property Bytes[Index: Integer]: TBytes read GetBytes write SetBytes;
  end;

const
  JSON_NO_TIMEZONE = -128;
  
var
  // �Ƿ������ϸ���ģʽ�����ϸ�ģʽ�£�
  // 1.���ƻ��ַ�������ʹ��˫���Ű�������,���ΪFalse�������ƿ���û�����Ż�ʹ�õ����š�
  // 2.ע�Ͳ���֧�֣����ΪFalse����֧��//��ע�ͺ�/**/�Ŀ�ע��
  StrictJson: Boolean = False;
  // �Ƿ�����Key��Сд</summary>
  JsonCaseSensitive: Boolean = True;
  // ָ����δ���RTTI�е�ö�ٺͼ�������
  JsonRttiEnumAsInt: Boolean = True;
  {$IFNDEF USEYxdStr}
  // ����Java��ʽ���룬��#$0�ַ�����Ϊ#$C080
  JavaFormatUtf8: Boolean = True;
  {$ENDIF}

var
  //����ʱ�����͵�ʱ��������Strictģʽ����Ч������Ϊ��Ӧ��ʱ�����Ա����
  JsonTimezone: Shortint = JSON_NO_TIMEZONE; // Ĭ����ʱ��
  //��������ת��ΪJson����ʱ��ת�����ַ������������������θ�ʽ��
  JsonDateFormat: JSONString = 'yyyy-mm-dd';
  //ʱ������ת��ΪJson����ʱ��ת�����ַ������������������θ�ʽ��
  JsonTimeFormat: JSONString = 'hh:nn:ss.zzz';
  //����ʱ������ת��ΪJson����ʱ��ת�����ַ������������������θ�ʽ��
  JsonDateTimeFormat: JSONString = 'yyyy-mm-dd hh:nn:ss.zzz';
  //���������� (0 �Զ�)
  JsonFloatDigits: Integer = 0;
  //Json �ϸ�ģʽ���������͵ľ��ȣ�Ĭ��Ϊ���룬��������Ϊ���Ա���ĳЩϵͳ����
  JsonDatePrecision: TJsonDatePrecision = jdpMillisecond;
  //Json ����ʱ���ʽ����ʽ
  JsonDateFormatStyle: TJsonDateFormatStyle = jdsNormal;
  //����תΪ����ʱ��ʱ��ת����ʽ
  JsonIntToTimeStyle: TJsonIntToTimeStyle;
  //blobת�ַ����Ƿ�ʹ��Base64
  JsonBlobBase64: Boolean = True;
  //Json ���ƺ����һ���ո�
  JsonNameAfterSpace: Boolean = False;

{$IFNDEF USEYxdStr}
function StrDupX(const s: PJSONChar; ACount:Integer): JSONString;
function StrDup(const S: PJSONChar; AOffset: Integer = 0; const ACount: Integer = MaxInt): JSONString;
function IsHexChar(c: JSONChar): Boolean; {$IFDEF USEINLINE}inline;{$ENDIF}
function HexValue(c: JSONChar): Integer;
function HexChar(v: Byte): JSONChar;
function BinToHex(p: Pointer; l: Integer): JSONString; overload;
function BinToHex(const ABytes:TBytes): JSONString; overload;
procedure HexToBin(p: Pointer; l: Integer; var AResult: TBytes); overload;
function HexToBin(const S: JSONString): TBytes; overload;
procedure HexToBin(const S: JSONString; var AResult: TBytes); overload;
{$ENDIF}
//����ַ��Ƿ���ָ�����б���
{$IFNDEF USEYxdStr}
function CharIn(const c, list: PJSONChar; ACharLen:PInteger = nil): Boolean; {$IFDEF USEINLINE}inline;{$ENDIF}
{$IFNDEF NEXTGEN}
function CharInA(c, list: PAnsiChar; ACharLen: PInteger = nil): Boolean;
function CharInU(c, list: PAnsiChar; ACharLen: PInteger = nil): Boolean;
{$ENDIF}
function CharInW(c, list: PWideChar; ACharLen: PInteger = nil): Boolean;
{$ENDIF}
//���㵱ǰ�ַ��ĳ���
{$IFNDEF USEYxdStr}
function CharSizeA(c: PAnsiChar): Integer;
function CharSizeU(c: PAnsiChar): Integer;
function CharSizeW(c: PWideChar): Integer;
function CharUpperA(c: AnsiChar): AnsiChar;
function CharUpperW(c: WideChar): WideChar;
//�����ַ��������кţ������е���ʼ��ַ
function StrPosA(start, current: PAnsiChar; var ACol, ARow:Integer): PAnsiChar;
function StrPosU(start, current: PAnsiChar; var ACol, ARow:Integer): PAnsiChar;
function StrPosW(start, current: PWideChar; var ACol, ARow:Integer): PWideChar;
//��ȡһ��
function DecodeLineA(var p:PAnsiChar; ASkipEmpty:Boolean=True): JSONStringA;
function DecodeLineW(var p:PWideChar; ASkipEmpty:Boolean=True): JSONStringW;
//�����հ��ַ������� Ansi���룬��������#9#10#13#161#161������UCS���룬��������#9#10#13#$3000
function SkipSpaceA(var p: PAnsiChar): Integer;
function SkipSpaceU(var p: PAnsiChar): Integer;
function SkipSpaceW(var p: PWideChar): Integer;
//����һ��,��#10Ϊ�н�β
function SkipLineA(var p: PAnsiChar): Integer;
function SkipLineU(var p: PAnsiChar): Integer;
function SkipLineW(var p: PWideChar): Integer;
//����Ƿ��ǿհ��ַ�
function IsSpaceA(const c:PAnsiChar; ASpaceSize:PInteger=nil): Boolean;
function IsSpaceU(const c:PAnsiChar; ASpaceSize:PInteger=nil): Boolean;
function IsSpaceW(const c:PWideChar; ASpaceSize:PInteger=nil): Boolean;
//����ֱ������ָ�����ַ�
{$IFNDEF NEXTGEN}
function SkipUntilA(var p: PAnsiChar; AExpects: PAnsiChar; AQuoter: AnsiChar = {$IFDEF NEXTGEN}0{$ELSE}#0{$ENDIF}): Integer;
function SkipUntilU(var p: PAnsiChar; AExpects: PAnsiChar; AQuoter: AnsiChar = {$IFDEF NEXTGEN}0{$ELSE}#0{$ENDIF}): Integer;
{$ENDIF}
function SkipUntilW(var p: PWideChar; AExpects: PWideChar; AQuoter: WideChar = #0): Integer;
//�ж��Ƿ�����ָ�����ַ�����ʼ
function StartWith(s, startby: PJSONChar; AIgnoreCase: Boolean): Boolean;
{$ENDIF}
//�����ı�
{$IFNDEF USEYxdStr}
procedure SaveTextA(AStream: TStream; const S: JSONStringA);
procedure SaveTextU(AStream: TStream; const S: JSONStringA; AWriteBom: Boolean = True; IsUtf8: Boolean = False);
procedure SaveTextW(AStream: TStream; const S: JSONStringW; AWriteBom: Boolean = True);
procedure SaveTextWBE(AStream: TStream; const S: JSONStringW; AWriteBom: Boolean = True);
{$ENDIF}
//�����ı�
{$IFNDEF USEYxdStr}
function LoadTextA(AStream: TStream; AEncoding: TTextEncoding=teUnknown): JSONStringA; overload;
function LoadTextU(AStream: TStream; AEncoding: TTextEncoding=teUnknown): JSONStringA; overload;
function LoadTextW(AStream: TStream; AEncoding: TTextEncoding=teUnknown): JSONStringW; overload;
{$ENDIF}
//����ת��
{$IFNDEF USEYxdStr}
function AnsiEncode(p:PWideChar; l:Integer): JSONStringA; overload;
function AnsiEncode(const p: JSONStringW): JSONStringA; overload;
{$IFNDEF MSWINDOWS}
function AnsiDecode(const S: AnsiString): JSONStringW; overload;
{$ENDIF}
function AnsiDecode(p: PAnsiChar; l:Integer): JSONStringW; overload;
function Utf8Encode(const p: JSONStringW): JSONStringA; overload;
function Utf8Encode(p: PWideChar; l: Integer): JSONStringA; overload;
{$IFNDEF MSWINDOWS}
function Utf8Decode(const S: AnsiString): JSONStringW; overload;
{$ENDIF}
function Utf8Decode(p: PAnsiChar; l: Integer): JSONStringW; overload;
{$ENDIF}
function ParseDateTime(s: PJSONChar; var AResult:TDateTime):Boolean;
function ParseJsonTime(p: PJSONChar; var ATime: TDateTime): Boolean;
function ParseWebTime(p:PJSONChar; var AResult:TDateTime):Boolean;
function FloatToStr(const value: Extended): string; {$IFDEF USEINLINE}inline;{$ENDIF}

procedure WriteVarArrayToStream(pvVar: Variant; pvStream: TStream);
function ReadVarArrayFromStream(pvStream: TStream; pvSize:Integer = -1): Variant;

const
  JsonTypeName: array [0 .. 8] of JSONString = ('Unknown', 'Null', 'String',
    'Integer', 'Float', 'Boolean', 'DateTime', 'Array', 'Object');

resourcestring
  SBadConvert = '%s ����һ����Ч�� %s ���͵�ֵ��';

implementation

{$IFDEF USERTTI}uses YxdRtti;{$ENDIF}

resourcestring
  {$IFNDEF USEYxdStr}{$IFDEF NEXTGEN}
  SOutOfIndex = '����Խ�磬ֵ %d ����[%d..%d]�ķ�Χ�ڡ�';
  {$ENDIF}{$ENDIF}
  {$IFNDEF USEYxdStr}
  SBadUnicodeChar = '��Ч��Unicode�ַ�:%d';
  {$ENDIF}
  SBadJson = '��ǰ���ݲ�����Ч��JSON�ַ���.';
  SCharNeeded = '��ǰλ��Ӧ���� "%s", ������ "%s".';
  SBadNumeric = '"%s"������Ч����ֵ.';
  SBadJsonTime = '"%s"����һ����Ч������ʱ��ֵ.';
  SNameNotFound = '��Ŀ����δ�ҵ�.';
  SCommentNotSupport = '�ϸ�ģʽ�²�֧��ע��, Ҫ��������ע�͵�JSON����, �뽫StrictJson��������ΪFalse.';
  SUnsupportArrayItem = '��ӵĶ�̬�����%d��Ԫ�����Ͳ���֧�֡�';
  SBadStringStart = '�ϸ����JSON�ַ���������"��ʼ��';
  SUnknownToken = '�޷�ʶ���ע�ͷ�, ע�ͱ�����//��/**/����.';
  SNotSupport = '���� [%s] �ڵ�ǰ���������²���֧��.';
  SBadJsonArray = '%s ����һ����Ч��JSON���鶨��.';
  SBadJsonObject = '%s ����һ����Ч��JSON������.';
  SBadJsonEncoding = '��Ч�ı���, ����ֻ����UTF-8, ANSI, Unicode 16 LE, Unicode 16 BE.';
  SJsonParseError = '��%d�е�%d��: %s '#13#10'��: %s';
  SNoExistJSONKey = 'JSON�����в�����ָ����Key: %s';
  SBadJsonName = '%s ����һ����Ч��JSON��������.';
  SBadNameStart = 'Json�������Ӧ��''"''�ַ���ʼ.';
  SBadNameEnd = 'Json��������δ��ȷ����.';
  SEndCharNeeded = '��ǰλ����ҪJson�����ַ�",]}".';
  SUnknownError = 'δ֪�Ĵ���.';
  SParamMissed = '���� %s ͬ���Ľ��δ�ҵ�.';
  SMethodMissed = 'ָ���ĺ��� %s ������.';
  SObjectChildNeedName = '���� %s �ĵ� %d ���ӽ������δ��ֵ, �������ǰ���踳ֵ.';
  SExpectingEOF = '����EOF: ';

const
  EParse_Unknown            = -1;
  EParse_BadStringStart     = 1;
  EParse_BadJson            = 2;
  EParse_CommentNotSupport  = 3;
  EParse_UnknownToken       = 4;
  EParse_EndCharNeeded      = 5;
  EParse_BadNameStart       = 6;
  EParse_BadNameEnd         = 7;
  EParse_NameNotFound       = 8;
  EParse_ExpectingEOF       = 9;

const
  CharStringStart:  PJSONChar = '"';
  CharStringEnd:    PJSONChar = '",';
  CharNameEnd:      PJSONChar = '": ';
  CharArrayStart:   PJSONChar = '[';
  CharArrayEnd:     PJSONChar = '],';
  CharObjectStart:  PJSONChar = '{';
  CharObjectEnd:    PJSONChar = '},';
  CharObjectEmpty:  PJSONChar = '{} ';
  CharArrayEmpty:   PJSONChar = '[] ';
  CharNull:         PJSONChar = 'null,';
  CharFalse:        PJSONChar = 'false,';
  CharTrue:         PJSONChar = 'true,';
  CharComma:        PJSONChar = ',';
  CharNum0:         PJSONChar = '0';
  CharNum1:         PJSONChar = '1';
  Char7:            PJSONChar = '\a';
  Char8:            PJSONChar = '\b';
  Char9:            PJSONChar = '\t';
  Char10:           PJSONChar = '\n';
  Char11:           PJSONChar = '\v';
  Char12:           PJSONChar = '\f';
  Char13:           PJSONChar = '\r';
  CharQuoter:       PJSONChar = '\"';
  CharBackslash:    PJSONChar = '\\';
  CharCode:         PJSONChar = '\u00';
  CharEscape:       PJSONChar = '\u';

{$IFDEF USERTTI}
type
  TJsonSerializeWriter = class(TSerializeWriter)
  private
    FData: TStringCatHelper;
    FIsArray: Boolean;
    FDoEscape: Boolean;
    procedure WriteName(const Name: string); {$IFDEF USEINLINE}inline;{$ENDIF}
  protected
    procedure BeginRoot; override;
    procedure EndRoot; override;

    procedure BeginData(const Name: string; const IsArray: Boolean); override;
    procedure EndData(); override;

    procedure Add(const Value: string); overload; override;
    procedure Add(const Value: Integer); overload; override;
    procedure Add(const Value: Cardinal); overload; override;
    procedure Add(const Value: Double); overload; override;
    procedure Add(const Value: Boolean); overload; override;
    procedure Add(const Value: Variant); overload; override;
    procedure AddTime(const Value: TDateTime); overload; override;
    procedure AddInt64(const Value: Int64); overload; override;

    procedure WriteString(const Name, Value: string); override;
    procedure WriteInt(const Name: string; const Value: Integer); override;
    procedure WriteInt64(const Name: string; const Value: Int64); override;
    procedure WriteUInt(const Name: string; const Value: Cardinal); override;
    procedure WriteDateTime(const Name: string; const Value: TDateTime); override;
    procedure WriteBoolean(const Name: string; const Value: Boolean); override;
    procedure WriteFloat(const Name: string; const Value: Double); override;
    procedure WriteVariant(const Name: string; const Value: Variant); override;

    procedure WriteNull(const Name: string); override;
  public
    constructor Create;
    destructor Destroy; override;

    function ToString(): string; override;
    function IsArray: Boolean; override;
    property DoEscape: Boolean read FDoEscape write FDoEscape;
  end;
{$ENDIF}

type
  TPointerStream = class(TCustomMemoryStream)
  public
    constructor Create; overload;
    constructor Create(const Ptr: Pointer; ASize: Integer); overload;
    function Write(const Buffer; Count: Longint): Longint; override;
  end;

constructor TPointerStream.Create;
begin
  inherited Create;
end;

constructor TPointerStream.Create(const Ptr: Pointer; ASize: Integer);
begin
  inherited Create;
  SetPointer(Ptr, ASize);
end;

function TPointerStream.Write(const Buffer; Count: Longint): Longint;
begin
  raise Exception.Create('PointerStream Ban Written.');
end;

{$IFDEF USEPool}
type
  MAddrList = array of Pointer;
  PMAddrList = ^MAddrList;
type
  TMemPoolNotify = procedure(Sender: TObject; const AData: Pointer) of object;
  TMemPoolNew = procedure(Sender: TObject; var AData: Pointer) of object;
type
  TSyncMemPool = class(TObject)
  private
    FPool: MAddrList;
    FCount: Integer;
    FMaxSize: Integer;
    FBlockSize: Cardinal;
    FLocker: TCriticalSection;
  protected
    procedure DoFree(const AData: Pointer); virtual;
    procedure DoNew(var AData: Pointer); virtual;
  public
    constructor Create(BlockSize: Cardinal; MaxSize: Integer = 64);
    destructor Destroy; override;
    procedure Clear;
    procedure Lock; {$IFDEF USEINLINE}inline;{$ENDIF}
    procedure Unlock; {$IFDEF USEINLINE}inline;{$ENDIF}
    function Pop(): Pointer;
    procedure Push(const V: Pointer);
    property BlockSize: Cardinal read FBlockSize;
    property MaxSize: Integer read FMaxSize;
    property Count: Integer read FCount;
  end;

  TJsonClass = type of JSONBase;

  TSyncObjectPool = class(TSyncMemPool)
  private
    FClass: TJsonClass;
  protected
    procedure DoFree(const AData: Pointer); override;
    procedure DoNew(var AData: Pointer); override; 
  end;
  
function ClacBlockSize(const V: Cardinal): Cardinal;
begin
  Result := V;
  if Result > 64 then begin
    // ���С��64�ֽڶ��룬������ִ��Ч�����
    if Result mod 64 > 0 then
      Result := (Result div 64 + 1) * 64;
  end;
end;

procedure TSyncMemPool.Clear;
var
  I: Integer;
begin
  FLocker.Enter;
  try
    I := 0;
    while I < FCount do begin
      DoFree(FPool[I]);
      Inc(I);
    end;
  finally
    FLocker.Leave;
  end;
end;

constructor TSyncMemPool.Create(BlockSize: Cardinal; MaxSize: Integer);
begin
  FLocker := TCriticalSection.Create;
  FCount := 0;
  if MaxSize < 4 then
    FMaxSize := 4
  else
    FMaxSize := MaxSize;
  SetLength(FPool, FMaxSize);
  FBlockSize := ClacBlockSize(BlockSize);
end;

destructor TSyncMemPool.Destroy;
begin
  try
    Clear;
  finally
    FreeAndNil(FLocker);  
    inherited;
  end;
end;

procedure TSyncMemPool.DoFree(const AData: Pointer);
begin
  FreeMem(AData);
end;

procedure TSyncMemPool.DoNew(var AData: Pointer);
begin
  GetMem(AData, FBlockSize);
end;

procedure TSyncMemPool.Lock;
begin
  FLocker.Enter;
end;

function TSyncMemPool.Pop: Pointer;
begin
  FLocker.Enter;
  if FCount > 0 then begin
    Dec(FCount);
    Result := FPool[FCount];
    FLocker.Leave;
    Exit;
  end;
  FLocker.Leave;
  DoNew(Result);
end;

procedure TSyncMemPool.Push(const V: Pointer);
begin
  if V = nil then Exit;  
  FLocker.Enter;
  if FCount < FMaxSize then begin
    FPool[FCount] := V;
    Inc(FCount);
    FLocker.Leave;
    Exit;
  end;
  FLocker.Leave;
  DoFree(V);
end;

procedure TSyncMemPool.Unlock;
begin
  FLocker.Leave;
end;

{ TSyncObjectPool }

procedure TSyncObjectPool.DoFree(const AData: Pointer);
begin
  TObject(AData).Free;
end;

procedure TSyncObjectPool.DoNew(var AData: Pointer);
begin
  AData := FClass.Create;
end;

var
  Pool_JsonValue: TSyncMemPool;
  Pool_JsonObject: TSyncObjectPool;
  Pool_JsonArray: TSyncObjectPool;
{$ENDIF}

function NewJsonValue(): PJSONValue; {$IFNDEF USEPool}{$IFDEF USEINLINE}inline;{$ENDIF}{$ENDIF}
begin
  {$IFDEF USEPool}
  Result := Pool_JsonValue.Pop;
  FillChar(Result^, Pool_JsonValue.FBlockSize, 0);
  {$ELSE}
  New(Result);
  {$ENDIF}
end;

procedure FreeJsonValue(var P: PJSONValue); {$IFNDEF USEPool}{$IFDEF USEINLINE}inline;{$ENDIF}{$ENDIF}
begin
  {$IFDEF USEPool}
  P.FName := '';
  SetLength(P.FValue, 0);
  Pool_JsonValue.Push(P);
  {$ELSE}
  Dispose(P);
  {$ENDIF}
end;

function NewJsonObject: JSONObject; {$IFNDEF USEPool}{$IFDEF USEINLINE}inline;{$ENDIF}{$ENDIF}
begin
  {$IFDEF USEPool}
  Result := JSONObject(Pool_JsonObject.Pop);
  {$ELSE}
  Result := JSONObject.Create;
  {$ENDIF}
end;

procedure FreeJsonObject(var V: JSONBase); {$IFNDEF USEPool}{$IFDEF USEINLINE}inline;{$ENDIF}{$ENDIF}
begin
  {$IFDEF USEPool}
  V.Clear;
  Pool_JsonObject.Push(Pointer(V));
  {$ELSE}
  FreeAndNil(V);
  {$ENDIF}
end;

function NewJsonArray: JSONArray; {$IFNDEF USEPool}{$IFDEF USEINLINE}inline;{$ENDIF}{$ENDIF}
begin
  {$IFDEF USEPool}
  Result := JSONArray(Pool_JsonArray.Pop);
  {$ELSE}
  Result := JSONArray.Create;
  {$ENDIF}
end;

procedure FreeJsonArray(var V: JSONBase); {$IFNDEF USEPool}{$IFDEF USEINLINE}inline;{$ENDIF}{$ENDIF}
begin
  {$IFDEF USEPool}
  V.Clear;
  Pool_JsonArray.Push(Pointer(V));
  {$ELSE}
  FreeAndNil(V);
  {$ENDIF}
end;

{$IFNDEF USEBase64}
{$IFNDEF JSON_UNICODE}
type
  Base64String = AnsiString;
const
  Base64_Chars: array[0..63] of AnsiChar = 'ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/';
  Base64_Bytes: array[0..79] of Byte =
  (
    62, 0, 0, 0, 63, 52, 53, 54, 55, 56, 57, 58, 59, 60, 61, 0,
    0, 0, 0, 0, 0, 0, 0, 1, 2, 3, 4, 5, 6, 7, 8, 9,
    10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25,
    0, 0, 0, 0, 0, 0, 26, 27, 28, 29, 30, 31, 32, 33, 34, 35,
    36, 37, 38, 39, 40, 41, 42, 43, 44, 45, 46, 47, 48, 49, 50, 51
  );
type
  Base64Proc = function(const Source; SourceSize: Integer; var Buf): Integer;

function Base64Encode(const Source; SourceSize: Integer; var Base64Buf): Integer; overload;
asm
    push    ebp
    push    esi
    push    edi
    push    ebx
    mov     esi, eax         // esi = Source
    mov     edi, ecx         // edi = Buf
    mov     eax, edx
    cdq
    mov     ecx, 3
    div     ecx              // edx = SourceSize % 3
    mov     ecx, eax         // ecx = SourceSize / 3
    test    edx, edx         
    jz      @@1
    inc     eax              // eax = (SourceSize + 2) / 3
  @@1:
    push    eax
    push    edx
    lea     ebp, Base64_Chars
    jecxz   @Last
    cld
  @EncodeLoop:               //  while (ecx > 0){
    mov     edx, [esi]       //   edx = 00000000 33333333 22222222 11111111
    bswap   edx              //   edx = 11111111 22222222 33333333 00000000
    push    edx
    push    edx
    push    edx
    pop     ebx              //   ebx = edx
    shr     edx, 20
    shr     ebx, 26          //   ebx = 00111111
    and     edx, 63          //   edx = 00112222
    mov     ah, [ebp + edx]  //   *(word*)edi = (Base64_Chars[edx] << 8) |
    mov     al, [ebp + ebx]  //     Base64_Chars[ebx]
    stosw                    //   edi += 2
    pop     edx              //   edx = 11111111 22222222 33333333 00000000
    pop     ebx              //   ebx = edx
    shr     edx, 8
    shr     ebx, 14
    and     edx, 63          //   edx = 00333333
    and     ebx, 63          //   ebx = 00222233
    mov     ah, [ebp + edx]  //   *(word*)edi = (Base64_Chars[edx] << 8) |
    mov     al, [ebp + ebx]  //     Base64_Chars[ebx]
    stosw                    //   edi += 2
    add     esi, 3           //   esi += 3
    loop    @EncodeLoop      // }
  @Last:
    pop     ecx              // ecx = SourceSize % 3
    jecxz   @end             // if (ecx == 0) return
    mov     eax, 3d3d0000h   // preset 2 bytes '='
    mov     [edi], eax
    test    ecx, 2
    jnz     @@3
    mov     al, [esi]        // if (ecx == 1)
    shl     eax, 4           //   eax = *esi << 4
    jmp     @@4
  @@3:
    mov     ax, [esi]        // else
    xchg    al, ah           //   eax = ((*esi << 8) or *(esi + 1)) << 2
    shl     eax, 2
  @@4:
    add     edi, ecx         // edi += ecx
    inc     ecx              // ecx = last encode bytes
  @LastLoop:
    mov     edx, eax         // for (; cex > 0; ecx --, edi --)
    and     edx, 63          // {
    mov     dl, [ebp + edx]  //   edx = eax & 63
    mov     [edi], dl        //   *edi = Base64_Chars[edx]
    shr     eax, 6           //   eax >>= 6
    dec     edi              // }
    loop    @LastLoop
  @end:
    pop     eax
    shl     eax, 2           // return  encode bytes
    pop     ebx
    pop     edi
    pop     esi
    pop     ebp
end;

function Base64Encode(const Source; SourceSize: Integer): Base64String; overload;
begin
  SetLength(Result, ((SourceSize + 2) div 3) shl 2);
  Base64Encode(Source, SourceSize, Result[1]);
end;

function Base64DecodeBufSize(const Base64Source; SourceSize: Integer): Integer;
asm
    mov     ecx, eax    // ecx = Source + Size
    add     ecx, edx
    mov     eax, edx    // eax = Size / 4 * 3
    shr     edx, 2
    shr     eax, 1
    add     eax, edx
    mov     edx, eax
    jz      @@2
  @@1:
    dec     ecx
    cmp     byte ptr [ecx], 61
    jne     @@2         // if (*--ecx == '=')
    dec     eax         //   eax --
    jmp     @@1
  @@2:                  // return eax: BufSize;  edx: Size / 4 * 3
end;

function Base64Decode(const Base64Source; SourceSize: Integer; var Buf): Integer; overload;
asm
    push    ebp
    push    esi
    push    edi
    push    ebx
    mov     esi, eax       // esi = Source
    mov     edi, ecx       // edi = Buf
    mov     ebx, edx
    call    Base64DecodeBufSize
    push    eax            // eax = Base64DecodeBufSize(Source, SourceSize)
    sub     edx, eax       // edx -= eax  // edx: '=' count
    lea     ebp, Base64_Bytes
    shr     ebx, 2         // ebx = SourceSize / 4
    test    ebx, ebx
    jz      @end
    push    edx
    cld
  @DecodeLoop:             // for (; ebx > 0; ebx --; edi += 3)
    mov     ecx, 4         // {
    xor     eax, eax
  @xchgLoop:               //   for (ecx = 4, eax = 0; ecx > 0; ecx --)
    movzx   edx, [esi]     //   {
    sub     edx, 43        //      edx = *(int*)esi - 43
    shl     eax, 6         //      eax <<= 6
    or      al, [ebp + edx]//      al |= Base64_Bytes[edx]
    inc     esi            //      esi ++
    loop    @xchgLoop      //   }
    bswap   eax            //   bswap(eax)
    dec     ebx            //   if (ebx == 1) break
    jz      @Last
    shr     eax, 8         //   eax >>= 8
    stosw                  //   *edi = ax; edi += 2
    shr     eax, 16        //   eax >>= 16
    stosb                  //   *edi++ = al
    jmp     @DecodeLoop    // }
  @Last:
    pop     ecx            
    xor     ecx, 3         // ecx = last bytes
  @LastLoop:               // for (; ecx > 0; ecx --)
    shr     eax, 8         // {
    stosb                  //   eax >>= 8; *edi ++ = al
    loop    @LastLoop      // }
  @end:
    pop     eax            // return eax
    pop     ebx
    pop     edi
    pop     esi
    pop     ebp
end;

function Base64Decode(const Base64Source; SourceSize: Integer): string; overload;
begin
  SetLength(Result, Base64DecodeBufSize(Base64Source, SourceSize));
  Base64Decode(Base64Source, SourceSize, Result[1]);
end;  
{$ENDIF}
{$ENDIF}

{$IFNDEF USEYxdStr}
const
  LowerHexChars: array [0 .. 15] of Char = ('0', '1', '2', '3', '4', '5', '6',
    '7', '8', '9', 'a', 'b', 'c', 'd', 'e', 'f');
{$ENDIF}

{$IFNDEF USEYxdStr}
//���㵱ǰ�ַ��ĳ���
// GB18030,����GBK��GB2312
// ���ֽڣ���ֵ��0��0x7F��
// ˫�ֽڣ���һ���ֽڵ�ֵ��0x81��0xFE���ڶ����ֽڵ�ֵ��0x40��0xFE��������0x7F����
// ���ֽڣ���һ���ֽڵ�ֵ��0x81��0xFE���ڶ����ֽڵ�ֵ��0x30��0x39���������ֽڴ�0x81��0xFE�����ĸ��ֽڴ�0x30��0x39��
function CharSizeA(c: PAnsiChar): Integer;
begin
  {$IFDEF MSWINDOWS}
  if GetACP = 936 then begin
  {$ELSE}
  if TEncoding.ANSI.CodePage = 936 then begin
  {$ENDIF}
    Result:=1;
    {$IFDEF NEXTGEN}
    if (c^>=$81) and (c^<=$FE) then begin
      Inc(c);
      if (c^>=$40) and (c^<=$FE) and (c^<>$7F) then
        Result:=2
      else if (c^>=$30) and (c^<=$39) then begin
        Inc(c);
        if (c^>=$81) and (c^<=$FE) then begin
          Inc(c);
          if (c^>=$30) and (c^<=$39) then
            Result:=4;
        end;
      end;
    end;
    {$ELSE}
    if (c^>=#$81) and (c^<=#$FE) then begin
      Inc(c);
      if (c^>=#$40) and (c^<=#$FE) and (c^<>#$7F) then
        Result:=2
      else if (c^>=#$30) and (c^<=#$39) then begin
        Inc(c);
        if (c^>=#$81) and (c^<=#$FE) then begin
          Inc(c);
          if (c^>=#$30) and (c^<=#$39) then
            Result:=4;
        end;
      end;
    end;
    {$ENDIF}
  end else
    {$IFDEF JSON_UNICODE}
    {$IFDEF NEXTGEN}
    if TEncoding.ANSI.CodePage = CP_UTF8 then
      Result := CharSizeU(c)
    else if (c^<128) or (TEncoding.ANSI.CodePage=437) then
      Result:=1
    else
      Result:=2;
    {$ELSE}
    {$IF RTLVersion>26}
    Result := AnsiStrings.StrCharLength(PAnsiChar(c));
    {$ELSE}
    Result := sysutils.StrCharLength(PAnsiChar(c));
    {$IFEND}
    {$ENDIF}
    {$ELSE}
    Result := StrCharLength(PAnsiChar(c));
    {$ENDIF}
end;
{$ENDIF}

{$IFNDEF USEYxdStr}
function CharSizeU(c: PAnsiChar): Integer;
begin
  if (Ord(c^) and $80) = 0 then
    Result := 1
  else begin
    if (Ord(c^) and $FC) = $FC then //4000000+
      Result := 6
    else if (Ord(c^) and $F8)=$F8 then//200000-3FFFFFF
      Result := 5
    else if (Ord(c^) and $F0)=$F0 then//10000-1FFFFF
      Result := 4
    else if (Ord(c^) and $E0)=$E0 then//800-FFFF
      Result := 3
    else if (Ord(c^) and $C0)=$C0 then//80-7FF
      Result := 2
    else
      Result := 1;
  end
end;
{$ENDIF}

{$IFNDEF USEYxdStr}
function CharSizeW(c: PWideChar): Integer;
begin
  if (c[0]>=#$DB00) and (c[0]<=#$DBFF) and (c[1] >= #$DC00) and (c[1] <= #$DFFF) then
    Result := 2
  else
    Result := 1;
end;
{$ENDIF}

{$IFNDEF USEYxdStr}
{$IFNDEF NEXTGEN}
procedure CalcCharLengthA(var Lens: TIntArray; list: PAnsiChar);
var
  i, l: Integer;
begin
  i := 0;
  System.SetLength(Lens, Length(List));
  while i< Length(List) do begin
    l := CharSizeA(@list[i]);
    lens[i] := l;
    Inc(i, l);
  end;
end;
{$ENDIF}

{$IFNDEF NEXTGEN}
procedure CalcCharLengthU(var Lens: TIntArray; list: PAnsiChar);
var
  i, l: Integer;
begin
  i := 0;
  System.SetLength(Lens, Length(List));
  while i< Length(List) do begin
    l := CharSizeU(@list[i]);
    lens[i] := l;
    Inc(i, l);
  end;
end;
{$ENDIF}
{$ENDIF}

// ����ַ��Ƿ���ָ�����б���
{$IFNDEF USEYxdStr}
function CharIn(const c, list: PJSONChar; ACharLen:PInteger = nil): Boolean;
begin
{$IFDEF JSON_UNICODE}
  Result := CharInW(c, list, ACharLen);
{$ELSE}
  Result := CharInA(c, list, ACharLen);
{$ENDIF}
end;
{$ENDIF}

{$IFNDEF USEYxdStr}{$IFNDEF NEXTGEN}
function CharInA(c, list: PAnsiChar; ACharLen: PInteger = nil): Boolean;
var
  i: Integer;
  lens: TIntArray;
begin
  Result := False;
  CalcCharLengthA(lens, list);
  i := 0;
  while i < Length(list) do begin
    if CompareMem(c, @list[i], lens[i]) then begin
      if ACharLen <> nil then
        ACharLen^:=lens[i];
      Result := True;
      Break;
    end else
      Inc(i, lens[i]);
  end;
end;
{$ENDIF} {$ENDIF}

{$IFNDEF USEYxdStr}
function CharInW(c, list: PWideChar; ACharLen: PInteger = nil): Boolean;
var
  p: PWideChar;
begin
  Result:=False;
  p := list;
  while p^ <> #0 do begin
    if p^ = c^ then begin
      if (p[0]>=#$DB00) and (p[0]<=#$DBFF) then begin
        if p[1]=c[1] then begin
          Result := True;
          if ACharLen <> nil then
            ACharLen^ := 2;
          Break;
        end;
      end else begin
        Result := True;
        if ACharLen <> nil then
          ACharLen^ := 1;
        Break;
      end;
    end;
    Inc(p);
  end;
end;
{$ENDIF}

{$IFNDEF USEYxdStr}{$IFNDEF NEXTGEN}
function CharInU(c, list: PAnsiChar; ACharLen: PInteger = nil): Boolean;
var
  i: Integer;
  lens: TIntArray;
begin
  Result := False;
  CalcCharLengthU(lens, list);
  i := 0;
  while i < Length(list) do begin
    if CompareMem(c, @list[i], lens[i]) then begin
      if ACharLen <> nil then
        ACharLen^ := lens[i];
      Result := True;
      Break;
    end else
      Inc(i, lens[i]);
  end;
end;
{$ENDIF} {$ENDIF}

{$IFNDEF USEYxdStr}
function StrDupX(const s: PJSONChar; ACount:Integer): JSONString;
begin
  SetLength(Result, ACount);
  Move(s^, PJSONChar(Result)^, ACount{$IFDEF JSON_UNICODE} shl 1{$ENDIF});
end;

function StrDup(const S: PJSONChar; AOffset: Integer; const ACount: Integer): JSONString;
var
  C, ACharSize: Integer;
  p, pds, pd: PJSONChar;
begin
  C := 0;
  p := S + AOffset;
  SetLength(Result, 4096);
  pd := PJSONChar(Result);
  pds := pd;
  while (p^ <> #0) and (C < ACount) do begin
    ACharSize := {$IFDEF JSON_UNICODE} CharSizeW(p); {$ELSE} CharSizeA(p); {$ENDIF}
    AOffset := pd - pds;
    if AOffset + ACharSize = Length(Result) then begin
      SetLength(Result, Length(Result){$IFDEF JSON_UNICODE} shl 1{$ENDIF});
      pds := PJSONChar(Result);
      pd := pds + AOffset;
    end;
    Inc(C);
    pd^ := p^;
    if ACharSize = 2 then
      pd[1] := p[1];
    Inc(pd, ACharSize);
    Inc(p, ACharSize);
  end;
  SetLength(Result, pd-pds);
end;
{$ENDIF}

{$IFNDEF USEYxdStr}
function StrPosA(start, current: PAnsiChar; var ACol, ARow:Integer): PAnsiChar;
begin
  ACol := 1;
  ARow := 1;
  Result := start;
  while IntPtr(start) < IntPtr(current) do begin
    if start^={$IFDEF NEXTGEN}10{$ELSE}#10{$ENDIF} then begin
      Inc(ARow);
      ACol := 1;
      Inc(start);
      Result := start;
    end else begin
      Inc(start, CharSizeA(start));
      Inc(ACol);
    end;
  end;
end;

function StrPosU(start, current: PAnsiChar; var ACol, ARow:Integer): PAnsiChar;
begin
  ACol := 1;
  ARow := 1;
  Result := start;
  while IntPtr(start)<IntPtr(current) do begin
    if start^={$IFDEF NEXTGEN}10{$ELSE}#10{$ENDIF} then begin
      Inc(ARow);
      ACol := 1;
      Inc(start);
      Result := start;
    end else begin
      Inc(start, CharSizeU(start));
      Inc(ACol);
    end;
  end;
end;

function StrPosW(start, current: PWideChar; var ACol, ARow:Integer): PWideChar;
begin
  ACol := 1;
  ARow := 1;
  Result := start;
  while start < current do begin
    if start^=#10 then begin
      Inc(ARow);
      ACol := 1;
      Inc(start);
      Result := start;
    end else begin
      Inc(start, CharSizeW(start));
      Inc(ACol);
    end;
  end;
end;
{$ENDIF}

{$IFNDEF USEYxdStr}
function DecodeLineA(var p: PAnsiChar; ASkipEmpty: Boolean): JSONStringA;
var
  ps: PAnsiChar;
  i: Integer;
begin
  ps := p;
  while p^<>{$IFDEF NEXTGEN}0{$ELSE}#0{$ENDIF} do begin
    if (PWORD(p)^ = $0D0A) or (PWORD(p)^ = $0A0D) then
      i := 2
    else if (p^ = {$IFDEF NEXTGEN}13{$ELSE}#13{$ENDIF}) then
      i := 1
    else
      i := 0;
    if i > 0 then begin
      if ps = p then begin
        if ASkipEmpty then begin
          Inc(p, i);
          ps := p;
        end else begin
          Result := '';
          Exit;
        end;
      end else begin
        {$IFDEF NEXTGEN}
        Result.Length := IntPtr(p)-IntPtr(ps);
        {$ELSE}
        SetLength(Result, p-ps);
        {$ENDIF}
        Move(ps^, PAnsiChar(Result)^, IntPtr(p)-IntPtr(ps));
        Inc(p, i);
        Exit;
      end;
    end else
      Inc(p);
  end;
  if ps = p then
    Result := ''
  else begin
    {$IFDEF NEXTGEN}
    Result.Length := IntPtr(p)-IntPtr(ps);
    {$ELSE}
    SetLength(Result, p-ps);
    {$ENDIF}
    Move(ps^, PAnsiChar(Result)^, IntPtr(p)-IntPtr(ps));
  end;
end;
{$ENDIF}

{$IFNDEF USEYxdStr}
function DecodeLineW(var p: PWideChar; ASkipEmpty: Boolean): JSONStringW;
var
  ps: PWideChar;
  i: Integer;
begin
  ps := p;
  while p^<>#0 do begin
    if (PCardinal(p)^ = $000D000A) or (PCardinal(p)^ = $000A000D) then
      i := 2
    else if (p^ = #13) then
      i := 1
    else
      i := 0;
    if i > 0 then begin
      if ps = p then begin
        if ASkipEmpty then begin
          Inc(p, i);
          ps := p;
        end else begin
          Result := '';
          Exit;
        end;
      end else begin
        SetLength(Result, p-ps);
        Move(ps^, PWideChar(Result)^, p-ps);
        Inc(p, i);
        Exit;
      end;
    end else
      Inc(p);
  end;
  if ps = p then
    Result := ''
  else begin
    SetLength(Result, p-ps);
    Move(ps^, PWideChar(Result)^, p-ps);
  end;
end;
{$ENDIF}

{$IFNDEF USEYxdStr}
function IsSpaceA(const c: PAnsiChar; ASpaceSize: PInteger): Boolean;
begin
  {$IFDEF NEXTGEN}
  if c^ in [9, 10, 13, 32] then begin
  {$ELSE}
  if c^ in [#9, #10, #13, #32] then begin
  {$ENDIF}
    Result := True;
    if ASpaceSize <> nil then
      ASpaceSize^ := 1;
  end else if PWORD(c)^ = $A1A1 then begin
    Result := True;
    if ASpaceSize <> nil then
      ASpaceSize^ := 2;
  end else
    Result:=False;
end;

function IsSpaceW(const c: PWideChar; ASpaceSize: PInteger): Boolean;
begin
  Result := (c^=#9) or (c^=#10) or (c^=#13) or (c^=#32) or (c^=#$3000);
  if Result and (ASpaceSize <> nil) then
    ASpaceSize^ := 1;
end;

//ȫ�ǿո�$3000��UTF-8������227,128,128
function IsSpaceU(const c: PAnsiChar; ASpaceSize: PInteger): Boolean;
begin
  {$IFDEF NEXTGEN}
  if c^ in [9, 10, 13, 32] then begin
  {$ELSE}
  if c^ in [#9, #10, #13, #32] then begin
  {$ENDIF}
    Result := True;
    if (ASpaceSize <> nil) then
      ASpaceSize^ := 1;
  end else if (c^={$IFDEF NEXTGEN}227{$ELSE}#227{$ENDIF}) and (PWORD(IntPtr(c)+1)^ = $8080) then begin
    Result := True;
    if (ASpaceSize <> nil) then
      ASpaceSize^ := 3;
  end else
    Result:=False;
end;
{$ENDIF}

{$IFNDEF USEYxdStr}
function SkipSpaceA(var p: PAnsiChar): Integer;
var
  ps: PAnsiChar;
  L: Integer;
begin
  ps := p;
  while p^<>{$IFDEF NEXTGEN}0{$ELSE}#0{$ENDIF} do begin
    if IsSpaceA(p, @L) then
      Inc(p, L)
    else
      Break;
  end;
  Result:= IntPtr(p) - IntPtr(ps);
end;

function SkipSpaceU(var p: PAnsiChar): Integer;
var
  ps: PAnsiChar;
  L: Integer;
begin
  ps := p;
  while p^<>{$IFDEF NEXTGEN}0{$ELSE}#0{$ENDIF} do begin
    if IsSpaceU(p, @L) then
      Inc(p, L)
    else
      Break;
  end;
  Result:= IntPtr(p) - IntPtr(ps);
end;

function SkipSpaceW(var p: PWideChar): Integer;
var
  ps: PWideChar;
  L:Integer;
begin
  ps := p;
  while p^<>#0 do begin
    if IsSpaceW(p, @L) then
      Inc(p, L)
    else
      Break;
  end;
  Result := p - ps;
end;
{$ENDIF}

{$IFNDEF USEYxdStr}
function SkipLineA(var p: PAnsiChar): Integer;
var
  ps: PAnsiChar;
begin
  ps := p;
  while p^ <> {$IFDEF NEXTGEN}0{$ELSE}#0{$ENDIF} do begin
    if (PWORD(p)^ = $0D0A) or (PWORD(p)^ = $0A0D) then begin
      Inc(p, 2);
      Break;
    end else if  (p^ = {$IFDEF NEXTGEN}13{$ELSE}#13{$ENDIF}) then begin
      Inc(p);
      Break;
    end else
      Inc(p);
  end;
  Result := IntPtr(p) - IntPtr(ps);
end;

function SkipLineU(var p: PAnsiChar): Integer;
begin
  Result := SkipLineA(p);
end;

function SkipLineW(var p: PWideChar): Integer;
var
  ps: PWideChar;
begin
  ps := p;
  while p^ <> #0 do begin
    if (PCardinal(p)^ = $000D000A) or (PCardinal(p)^ = $000A000D) then begin
      Inc(p, 2);
      Break;
    end else if  (p^ = #13) then begin
      Inc(p);
      Break;
    end else
      Inc(p);
  end;
  Result := p - ps;
end;
{$ENDIF}

{$IFNDEF USEYxdStr}{$IFNDEF NEXTGEN}
function SkipUntilA(var p: PAnsiChar; AExpects: PAnsiChar; AQuoter: AnsiChar): Integer;
var
  ps: PAnsiChar;
begin
  ps := p;
  while p^<>{$IFDEF NEXTGEN}0{$ELSE}#0{$ENDIF} do begin
    if (p^ = AQuoter) then begin
      Inc(p);
      while p^<>{$IFDEF NEXTGEN}0{$ELSE}#0{$ENDIF} do begin
        if p^ = {$IFDEF NEXTGEN}$5C{$ELSE}#$5C{$ENDIF} then begin
          Inc(p);
          if p^<>{$IFDEF NEXTGEN}0{$ELSE}#0{$ENDIF} then
            Inc(p);
        end else if p^ = AQuoter then begin
          Inc(p);
          if p^ = AQuoter then
            Inc(p)
          else
            Break;
        end else
          Inc(p);
      end;
    end else if CharInA(p, AExpects) then
      Break
    else
      Inc(p, CharSizeA(p));
  end;
  Result := IntPtr(p) - IntPtr(ps);
end;
{$ENDIF} {$ENDIF}
{$IFNDEF USEYxdStr}{$IFNDEF NEXTGEN}
function SkipUntilU(var p: PAnsiChar; AExpects: PAnsiChar; AQuoter: AnsiChar): Integer;
var
  ps: PAnsiChar;
begin
  ps := p;
  while p^<>#0 do begin
    if (p^ = AQuoter) then begin
      Inc(p);
      while p^<>#0 do begin
        if p^=#$5C then begin
          Inc(p);
          if p^<>#0 then
            Inc(p);
        end else if p^=AQuoter then begin
          Inc(p);
          if p^=AQuoter then
            Inc(p)
          else
            Break;
        end else
          Inc(p);
      end;
    end else if CharInU(p, AExpects) then
      Break
    else
      Inc(p, CharSizeU(p));
  end;
  Result := p - ps;
end;
{$ENDIF} {$ENDIF}

{$IFNDEF USEYxdStr}
function SkipUntilW(var p: PWideChar; AExpects: PWideChar; AQuoter: WideChar): Integer;
var
  ps: PWideChar;
begin
  ps := p;
  while p^<>#0 do begin
    if (p^=AQuoter) then begin
      Inc(p);
      while p^<>#0 do begin
        if p^=#$5C then begin
          Inc(p);
          if p^<>#0 then
            Inc(p);
        end else if p^=AQuoter then begin
          Inc(p);
          if p^=AQuoter then
            Inc(p)
          else
            Break;
        end else
          Inc(p);
      end;
    end else if CharInW(p, AExpects) then
      Break
    else
      Inc(p, CharSizeW(p));
  end;
  Result := p - ps;
end;
{$ENDIF}

{$IFNDEF USEYxdStr}
function CharUpperA(c: AnsiChar): AnsiChar;
begin
  {$IFNDEF NEXTGEN}
  if (c>=#$61) and (c<=#$7A) then
  {$ELSE}
  if (c>=$61) and (c<=$7A) then
  {$ENDIF}
    Result := AnsiChar(Ord(c)-$20)
  else
    Result := c;
end;
{$ENDIF}

{$IFNDEF USEYxdStr}
function CharUpperW(c: WideChar): WideChar;
begin
  if (c>=#$61) and (c<=#$7A) then
    Result := WideChar(PWord(@c)^-$20)
  else
    Result := c;
end;
{$ENDIF}

{$IFNDEF USEYxdStr}
function StartWith(s, startby: PJSONChar; AIgnoreCase: Boolean): Boolean;
begin
  while (s^<>#0) and (startby^<>#0) do begin
    if AIgnoreCase then begin
      {$IFDEF JSON_UNICODE}
      if CharUpperW(s^) <> CharUpperW(startby^) then
      {$ELSE}
      if CharUpperA(s^) <> CharUpperA(startby^) then
      {$ENDIF}
        Break;
    end else if s^ <> startby^ then
      Break;
    Inc(s);
    Inc(startby);
  end;
  Result := startby^ = #0;
end;
{$ENDIF}

{$IFNDEF USEYxdStr}
function StartWithIgnoreCase(s, startby: PJSONChar): Boolean;
begin
  while (s^<>#0) and (startby^<>#0) do begin
    {$IFDEF JSON_UNICODE}
    if CharUpperW(s^) <> CharUpperW(startby^) then
    {$ELSE}
    if CharUpperA(s^) <> CharUpperA(startby^) then
    {$ENDIF}
      Break;
    Inc(s);
    Inc(startby);
  end;
  Result := startby^ = #0;
end;
{$ENDIF}

//function HashOf(const Key: Pointer; KeyLen: Cardinal): Cardinal;
//var
//  ps: PCardinal;
//  lr: Cardinal;
//begin
//  Result := 0;
//  if KeyLen > 0 then begin
//    ps := Key;
//    lr := (KeyLen and $03);//��鳤���Ƿ�Ϊ4��������
//    KeyLen := (KeyLen and $FFFFFFFC);//��������
//    while KeyLen > 0 do begin
//      Result := ((Result shl 5) or (Result shr 27)) xor ps^;
//      Inc(ps);
//      Dec(KeyLen, 4);
//    end;
//    if lr <> 0 then begin
//      case lr of
//        1: KeyLen := PByte(ps)^;
//        2: KeyLen := PWORD(ps)^;
//        3: KeyLen := PWORD(ps)^ or (PByte(Cardinal(ps) + 2)^ shl 16);
//      end;
//      Result := ((Result shl 5) or (Result shr 27)) xor KeyLen;
//    end;
//  end;
//end;

function HashOf(P: Pointer; L: Integer): Cardinal;
{$IFDEF WIN32}
label A00, A01;
begin
  asm
    push ebx
    mov eax,l
    mov ebx,0
    cmp eax,ebx
    jz A01
    xor    eax, eax
    mov    edx, p
    mov    ebx,edx
    add    ebx,l
    A00:
    imul   eax,131
    movzx  ecx, BYTE ptr [edx]
    inc    edx
    add    eax, ecx
    cmp   ebx, edx
    jne    A00
    A01:
    pop ebx
    mov Result,eax
  end;
{$ELSE}
var
  pe: PByte;
  ps: PByte absolute p;
const
  seed = 131;
  // 31 131 1313 13131 131313 etc..
begin
  pe := p;
  Inc(pe, l);
  Result := 0;
  while IntPtr(ps) < IntPtr(pe) do
  begin
    Result := Result * seed + ps^;
    Inc(ps);
  end;
  Result := Result and $7FFFFFFF;
{$ENDIF}
end;

{$IFNDEF USEYxdStr}
function IsHexChar(c: JSONChar): Boolean; {$IFDEF USEINLINE}inline;{$ENDIF}
begin
  Result:=((c>='0') and (c<='9')) or
    ((c>='a') and (c<='f')) or
    ((c>='A') and (c<='F'));
end;

function HexValue(c: JSONChar): Integer;
begin
  if (c>='0') and (c<='9') then
    Result := Ord(c) - Ord('0')
  else if (c>='a') and (c<='f') then
    Result := 10+ Ord(c)-Ord('a')
  else
    Result := 10+ Ord(c)-Ord('A');
end;

function HexChar(v: Byte): JSONChar;
begin
  if v<10 then
    Result := JSONChar(v + Ord('0'))
  else
    Result := JSONChar(v-10 + Ord('A'));
end;

function BinToHex(p:Pointer;l:Integer): JSONString;
const
  B2HConvert: array[0..15] of JSONChar = ('0', '1', '2', '3', '4', '5', '6', '7', '8', '9', 'A', 'B', 'C', 'D', 'E', 'F');
var
  pd: PJSONChar;
  pb: PByte;
begin
  SetLength(Result, l shl 1);
  pd := PJSONChar(Result);
  pb := p;
  while l>0 do begin
    pd^ := B2HConvert[pb^ shr 4];
    Inc(pd);
    pd^ := B2HConvert[pb^ and $0F];
    Inc(pd);
    Inc(pb);
    Dec(l);
  end;
end;

function BinToHex(const ABytes:TBytes): JSONString;
begin
  Result:=BinToHex(@ABytes[0], Length(ABytes));
end;

procedure HexToBin(p: Pointer; l: Integer; var AResult: TBytes);
var
  ps: PJSONChar;
  pd: PByte;
begin
  SetLength(AResult, l shr 1);
  ps := p;
  pd := @AResult[0];
  while ps - p < l do begin
    if IsHexChar(ps[0]) and IsHexChar(ps[1]) then begin
      pd^:=(HexValue(ps[0]) shl 4) + HexValue(ps[1]);
      Inc(pd);
      Inc(ps, 2);
    end else begin
      SetLength(AResult, 0);
      Exit;
    end;
  end;
end;

function HexToBin(const S: JSONString): TBytes;
begin
  HexToBin(PJSONChar(S), System.Length(S), Result);
end;

procedure HexToBin(const S: JSONString; var AResult: TBytes);
begin
  HexToBin(PJSONChar(S), System.Length(S), AResult);
end;
{$ENDIF}

function ParseHex(var p:PJSONChar;var Value:Int64):Integer;
var
  ps: PJSONChar;
begin
  Value := 0;
  ps := p;
  while IsHexChar(p^) do begin
    Value := (Value shl 4) + HexValue(p^);
    Inc(p);
  end;
  Result := p - ps;
end;

function ParseInt(var s:PJSONChar; var ANum:Int64):Integer;
var
  ps: PJSONChar;
  ANeg: Boolean;
begin
  ps := s;
  //����16���ƿ�ʼ�ַ�
  if s^ = '$' then begin
    Inc(s);
    Result := ParseHex(s, ANum);
  end else if (s^='0') and ((s[1]='x') or (s[1]='X')) then begin
    Inc(s, 2);
    Result := ParseHex(s, ANum);
  end else begin
    if (s^='-') then begin
      ANeg := True;
      Inc(s);
    end else begin
      ANeg := False;
      if s^='+' then
        Inc(s);
    end;
    ANum := 0;
    while (s^>='0') and (s^<='9') do begin
      ANum := ANum * 10 + Ord(s^)-Ord('0');
      Inc(s);
    end;
    if ANeg then
      ANum := -ANum;
    Result := s - ps;
  end;
end;

function ParseNumeric(var s: PJSONChar; var ANum:Extended): Boolean;
var
  ps: PJSONChar;

  function ParseHexInt(var s: PJSONChar):Boolean;
  var
    iVal:Int64;
  begin
    iVal:=0;
    while IsHexChar(s^) do begin
      iVal := (iVal shl 4) + HexValue(s^);
      Inc(s);
    end;
    Result := (s<>ps);
    ANum := iVal;
  end;

  function ParseDec(var s: PJSONChar): Boolean;
  var
    ACount:Integer;
    iVal:Int64;
    APow:Extended;
    ANeg: Boolean;
  begin
    ANeg := S^ = '-';
    if ANeg then
      Inc(S);
    ParseInt(s, iVal);
    if ANeg then
      ANum := -iVal
    else
      ANum := iVal;
    if s^='.' then begin //С������
      Inc(s);
      ACount := ParseInt(s, iVal);
      if ACount > 0 then begin
        if ANum < 0 then
          ANum := ANum - iVal / IntPower(10, ACount)
        else 
          ANum := ANum + iVal / IntPower(10, ACount);
      end;
    end;
    if (s^='e') or (s^='E') then begin
      Inc(s);
      if ParseNumeric(s, APow) then
        ANum := ANum * Power(10, APow);
    end;
    Result := (s <> ps);
  end;

begin
  ps := s;
  if (S^ = '$') or (S^ = '&') then begin
    Inc(s);
    Result := ParseHexInt(s);
    Exit;
  end else if (s^='0') and ((s[1]='x') or (s[1]='X')) then begin
    if StrictJson then begin
      Result := False;
      Exit;
    end; 
    Inc(s, 2);
    Result := ParseHexInt(s);
    Exit;
  end else
    Result := ParseDec(s);
end;

function ParseDateTime(s: PJSONChar; var AResult:TDateTime):Boolean;
var
  Y,M,D,H,N,Sec,MS: Word;
  AQuoter: JSONChar;
  ADate: TDateTime;

  function ParseNum(var n:Word):Boolean;
  var
    neg: Boolean;
    ps: PJSONChar;
  begin
    n := 0; ps := s;
    if s^ = '-' then begin
      neg := true;
      Inc(s);
    end else
      neg:=false;
    while s^<>#0 do begin
      if (s^>='0') and (s^<='9') then begin
        n:=n*10+Ord(s^)-48;
        Inc(s);
      end else
        Break;
    end;
    if neg then
      n := -n;
    Result := ps <> s;
  end;

begin
  if (s^='"') or (s^='''') then begin
    AQuoter := s^;
    Inc(s);
  end else
    AQuoter:=#0;
  Result := ParseNum(Y);
  if not Result then
    Exit;
  if s^='-' then begin
    Inc(s);
    Result:=ParseNum(M);
    if (not Result) or (s^<>'-') then
      Exit;
    Inc(s);
    Result:=ParseNum(D);
    if (not Result) or ((s^<>'T') and (s^<>' ') and (s^<>#0)) then
      Exit;
    if s^<>#0 then Inc(s);
    Result := TryEncodeDate(Y,M,D,ADate);
    if not Result then
      Exit;
    {$IFDEF JSON_UNICODE}SkipSpaceW{$ELSE}SkipSpaceA{$ENDIF}(s);
    if s^<>#0 then begin
      if not ParseNum(H) then begin //û��ʱ��ֵ
        AResult:=ADate;
        Exit;
      end;
      if s^<>':' then begin
        if H in [0..23] then
          AResult := ADate + EncodeTime(H,0,0,0)
        else
          Result:=False;
        Exit;
      end;
      Inc(s);
    end else begin
      AResult:=ADate;
      Exit;
    end;
  end else if s^=':' then begin
    ADate:=0;
    H:=Y;
    Inc(s);
  end else begin
    Result:=False;
    Exit;
  end;
  if H>23 then begin
    Result:=False;
    Exit;
  end;
  if not ParseNum(N) then begin
    if AQuoter<>#0 then begin
      if s^=AQuoter then
        AResult:=ADate+EncodeTime(H,0,0,0)
      else
        Result:=False;
    end else
      AResult:=ADate+EncodeTime(H,0,0,0);
    Exit;
  end else if N>59 then begin
    Result:=False;
    Exit;
  end;
  Sec:=0;
  MS:=0;
  if s^=':' then begin
    Inc(s);
    if not ParseNum(Sec) then begin
      if AQuoter<>#0 then begin
        if s^=AQuoter then
          AResult:=ADate+EncodeTime(H,N,0,0)
        else
          Result:=False;
      end else
        AResult:=ADate+EncodeTime(H,N,0,0);
      Exit;
    end else if Sec>59 then begin
      Result:=False;
      Exit;
    end;
    if s^='.' then begin
      Inc(s);
      if not ParseNum(MS) then begin
        if AQuoter<>#0 then begin
          if AQuoter=s^ then
            AResult:=ADate+EncodeTime(H,N,Sec,0)
          else
            Result:=False;
        end else
          AResult:=ADate+EncodeTime(H,N,Sec,0);
        Exit;
      end else if MS>=1000 then begin//����1000����΢��Ϊ��λ��ʱ�ģ�ת��Ϊ����
        while MS>=1000 do
          MS:=MS div 10;
      end;
      if AQuoter<>#0 then begin
        if AQuoter=s^ then
          AResult:=ADate+EncodeTime(H,N,Sec,MS)
        else
          Result:=False;
        Exit;
      end else
        AResult:=ADate+EncodeTime(H,N,Sec,MS);
    end else begin
      if AQuoter<>#0 then begin
        if AQuoter=s^ then
          AResult:=ADate+EncodeTime(H,N,Sec,0)
        else
          Result:=False;
      end else
        AResult:=ADate+EncodeTime(H,N,Sec,0)
    end;
  end else begin
    if AQuoter<>#0 then begin
      if AQuoter=s^ then
        AResult:=ADate+EncodeTime(H,N,0,0)
      else
        Result:=False;
    end else
      AResult:=ADate+EncodeTime(H,N,0,0);
  end;
end;

function ParseWebTime(p:PJSONChar;var AResult:TDateTime):Boolean;
var
  I:Integer;
  Y,M,D,H,N,S:Integer;
const
  MonthNames:array [0..11] of JSONString=('Jan', 'Feb', 'Mar', 'Apr', 'May',
    'Jun', 'Jul', 'Aug', 'Sep', 'Oct', 'Nov', 'Dec');
  Comma: PJSONChar = ',';
  Digits: PJSONChar = '0123456789';
begin
  //�������ڣ��������ֱ��ͨ�����ڼ������������Ҫ
  {$IFDEF JSON_UNICODE}SkipUntilW{$ELSE}SkipUntilA{$ENDIF}(p, Comma, #0);
  if p^=#0 then begin
    Result:=false;
    Exit;
  end else
    Inc(p);
  {$IFDEF JSON_UNICODE}SkipUntilW{$ELSE}SkipUntilA{$ENDIF}(p, Digits, #0);
  D := 0;
  //����
  while (p^>='0') and (p^<='9') do begin
    D:=D*10+Ord(p^)-Ord('0');
    Inc(p);
  end;
  if (D<1) or (D>31) then begin
    Result:=false;
    Exit;
  end;
  {$IFDEF JSON_UNICODE}SkipSpaceW{$ELSE}SkipSpaceA{$ENDIF}(p);
  M:=0;
  for I := 0 to 11 do begin
    if StartWith(p, PJSONChar(MonthNames[I]),true) then begin
      M:=I+1;
      Break;
    end;
  end;
  if (M<1) or (M>12) then begin
    Result:=False;
    Exit;
  end;
  while (p^<>#0) and ((p^<'0') or (p^>'9')) do
    Inc(p);
  Y:=0;
  while (p^>='0') and (p^<='9') do begin
    Y:=Y*10+Ord(p^)-Ord('0');
    Inc(p);
  end;
  while p^=' ' do Inc(p);
  H:=0;
  while (p^>='0') and (p^<='9') do begin
    H:=H*10+Ord(p^)-Ord('0');
    Inc(p);
  end;
  while p^=':' do Inc(p);
  N:=0;
  while (p^>='0') and (p^<='9') do begin
    N:=N*10+Ord(p^)-Ord('0');
    Inc(p);
  end;
  while p^=':' do Inc(p);
  S:=0;
  while (p^>='0') and (p^<='9') do begin
    S:=S*10+Ord(p^)-Ord('0');
    Inc(p);
  end;
  while p^=':' do Inc(p);
  Result := TryEncodeDateTime(Y,M,D,H,N,S,0,AResult);
end;

function ParseJsonTime(p: PJSONChar; var ATime: TDateTime): Boolean;
const
  UnixDelta: Int64 = 25569;
var
  MS, TimeZone: Int64;
begin
  // Javascript���ڸ�ʽΪ/DATE(��1970.1.1�����ڵĺ�����+ʱ��)/
  Result := False;
  if not StartWith(p, '/DATE', True) then
    Exit;
  Inc(p, 5);
  {$IFDEF JSON_UNICODE}SkipSpaceW{$ELSE}SkipSpaceA{$ENDIF}(p);
  if p^ <> '(' then
    Exit;
  Inc(p);
  {$IFDEF JSON_UNICODE}SkipSpaceW{$ELSE}SkipSpaceA{$ENDIF}(p);
  if ParseInt(p, MS) = 0 then
    Exit;
  {$IFDEF JSON_UNICODE}SkipSpaceW{$ELSE}SkipSpaceA{$ENDIF}(p);
  if (p^ = '+') or (p^ = '-') then begin
    if ParseInt(p, TimeZone) = 0 then
      Exit;
    {$IFDEF JSON_UNICODE}SkipSpaceW{$ELSE}SkipSpaceA{$ENDIF}(p);
  end else
    TimeZone := 0;
  if p^ = ')' then begin
    if (MS > 10000000000) or (JsonDatePrecision = jdpMillisecond) then
      ATime := UnixDelta + (MS div 86400000) + ((MS mod 86400000) / 86400000)
    else
      ATime := UnixDelta + (MS div 86400) + ((MS mod 86400) / 86400);
    if TimeZone <> 0 then
      ATime := IncHour(ATime, -TimeZone);
    Inc(p);
    {$IFDEF JSON_UNICODE}SkipSpaceW{$ELSE}SkipSpaceA{$ENDIF}(p);
    Result := True
  end;
end;

{$IFNDEF USEYxdStr}
function AnsiEncode(p:PWideChar; l:Integer): AnsiString;
var
  ps: PWideChar;
  len: Integer;
begin
  if l<=0 then begin
    ps:=p;
    while ps^<>#0 do Inc(ps);
    l:=ps-p;
  end;
  if l>0 then  begin
    {$IFDEF MSWINDOWS}
    len := WideCharToMultiByte(CP_ACP,0,p,l,nil,0,nil,nil);
    SetLength(Result, len);
    WideCharToMultiByte(CP_ACP,0,p,l,PAnsiChar(Result), len, nil, nil);
    {$ELSE}
    Result.Length:=l shl 1;
    Result.FValue[0]:=0;
    Move(p^,PAnsiChar(Result)^,l shl 1);
    Result:=TEncoding.Convert(TEncoding.Unicode,TEncoding.ANSI,Result.FValue,1,l shl 1);
    {$ENDIF}
  end else
    Result := '';
end;

function AnsiEncode(const p: JSONStringW):AnsiString;
begin
  Result := AnsiEncode(PWideChar(p), Length(p));
end;

{$IFNDEF MSWINDOWS}
function AnsiDecode(const S: AnsiString): JSONStringW;
begin
  if S.IsUtf8 then
    Result := Utf8Decode(S)
  else
    Result := TEncoding.ANSI.GetString(S.FValue, 1, S.Length);
end;
{$ENDIF}

function AnsiDecode(p: PAnsiChar; l:Integer): JSONStringW;
var
  ps: PAnsiChar;
{$IFNDEF MSWINDOWS}
  ABytes:TBytes;
{$ENDIF}
begin
  if l<=0 then begin
    ps := p;
    while ps^<>{$IFDEF NEXTGEN}0{$ELSE}#0{$ENDIF} do Inc(ps);
    l:=IntPtr(ps)-IntPtr(p);
  end;
  if l>0 then begin
    {$IFDEF MSWINDOWS}
    System.SetLength(Result, MultiByteToWideChar(CP_ACP,0,PAnsiChar(p),l,nil,0));
    MultiByteToWideChar(CP_ACP, 0, PAnsiChar(p),l,PWideChar(Result),Length(Result));
    {$ELSE}
    System.SetLength(ABytes, l);
    Move(p^, PByte(@ABytes[0])^, l);
    Result := TEncoding.ANSI.GetString(ABytes);
    {$ENDIF}
  end else
    System.SetLength(Result,0);
end;
{$ENDIF}

{$IFNDEF USEYxdStr}
procedure SaveTextA(AStream: TStream; const S: AnsiString);
begin
  AStream.WriteBuffer(PAnsiChar(S)^, Length(S))
end;
{$ENDIF}

{$IFNDEF USEYxdStr}
function Utf8Encode(const p: JSONStringW): AnsiString;
begin
  Result := Utf8Encode(PWideChar(p), Length(p));
end;

function Utf8Encode(p:PWideChar; l:Integer): AnsiString;
var
  ps:PWideChar;
  pd,pds:PAnsiChar;
  c:Cardinal;
begin
  if p=nil then
    Result := ''
  else begin
    if l<=0 then begin
      ps:=p;
      while ps^<>#0 do
        Inc(ps);
      l:=ps-p;
      end;
    {$IFDEF NEXTGEN}
    Result.Length:=l*6;
    {$ELSE}
    SetLength(Result, l*6);//UTF8ÿ���ַ����6�ֽڳ�,һ���Է����㹻�Ŀռ�
    {$ENDIF}
    if l>0 then begin
      Result[1] := {$IFDEF NEXTGEN}1{$ELSE}#1{$ENDIF};
      ps:=p;
      pd:=PAnsiChar(Result);
      pds:=pd;
      while l>0 do begin
        c:=Cardinal(ps^);
        Inc(ps);
        if (c>=$D800) and (c<=$DFFF) then begin//Unicode ��չ���ַ�
          c:=(c-$D800);
          if (ps^>=#$DC00) and (ps^<=#$DFFF) then begin
            c:=$10000+((c shl 10) + (Cardinal(ps^)-$DC00));
            Inc(ps);
            Dec(l);
          end else
            raise Exception.Create(Format(SBadUnicodeChar,[IntPtr(ps^)]));
        end;
        Dec(l);
        if c=$0 then begin
          if JavaFormatUtf8 then begin//����Java��ʽ���룬��#$0�ַ�����Ϊ#$C080
            pd^:={$IFDEF NEXTGEN}$C0{$ELSE}#$C0{$ENDIF};
            Inc(pd);
            pd^:={$IFDEF NEXTGEN}$80{$ELSE}#$80{$ENDIF};
            Inc(pd);
          end else begin
            pd^:=AnsiChar(c);
            Inc(pd);
          end;
        end else if c<=$7F then begin //1B
          pd^:=AnsiChar(c);
          Inc(pd);
        end else if c<=$7FF then begin//$80-$7FF,2B
          pd^:=AnsiChar($C0 or (c shr 6));
          Inc(pd);
          pd^:=AnsiChar($80 or (c and $3F));
          Inc(pd);
        end else if c<=$FFFF then begin //$8000 - $FFFF,3B
          pd^:=AnsiChar($E0 or (c shr 12));
          Inc(pd);
          pd^:=AnsiChar($80 or ((c shr 6) and $3F));
          Inc(pd);
          pd^:=AnsiChar($80 or (c and $3F));
          Inc(pd);
        end else if c<=$1FFFFF then begin //$01 0000-$1F FFFF,4B
          pd^:=AnsiChar($F0 or (c shr 18));//1111 0xxx
          Inc(pd);
          pd^:=AnsiChar($80 or ((c shr 12) and $3F));//10 xxxxxx
          Inc(pd);
          pd^:=AnsiChar($80 or ((c shr 6) and $3F));//10 xxxxxx
          Inc(pd);
          pd^:=AnsiChar($80 or (c and $3F));//10 xxxxxx
          Inc(pd);
        end else if c<=$3FFFFFF then begin//$20 0000 - $3FF FFFF,5B
          pd^:=AnsiChar($F8 or (c shr 24));//1111 10xx
          Inc(pd);
          pd^:=AnsiChar($F0 or ((c shr 18) and $3F));//10 xxxxxx
          Inc(pd);
          pd^:=AnsiChar($80 or ((c shr 12) and $3F));//10 xxxxxx
          Inc(pd);
          pd^:=AnsiChar($80 or ((c shr 6) and $3F));//10 xxxxxx
          Inc(pd);
          pd^:=AnsiChar($80 or (c and $3F));//10 xxxxxx
          Inc(pd);
        end else if c<=$7FFFFFFF then begin //$0400 0000-$7FFF FFFF,6B
          pd^:=AnsiChar($FC or (c shr 30));//1111 11xx
          Inc(pd);
          pd^:=AnsiChar($F8 or ((c shr 24) and $3F));//10 xxxxxx
          Inc(pd);
          pd^:=AnsiChar($F0 or ((c shr 18) and $3F));//10 xxxxxx
          Inc(pd);
          pd^:=AnsiChar($80 or ((c shr 12) and $3F));//10 xxxxxx
          Inc(pd);
          pd^:=AnsiChar($80 or ((c shr 6) and $3F));//10 xxxxxx
          Inc(pd);
          pd^:=AnsiChar($80 or (c and $3F));//10 xxxxxx
          Inc(pd);
        end;
      end;
      pd^:={$IFDEF NEXTGEN}0{$ELSE}#0{$ENDIF};
      {$IFDEF NEXTGEN}
      Result.Length := IntPtr(pd)-IntPtr(pds);
      {$ELSE}
      SetLength(Result, IntPtr(pd)-IntPtr(pds));
      {$ENDIF}
    end;
  end;
end;
{$ENDIF}

{$IFNDEF USEYxdStr} {$IFNDEF MSWINDOWS}
function Utf8Decode(const S: AnsiString): JSONStringW; overload;
begin
  if S.IsUtf8 then
    Result := Utf8Decode(PAnsiChar(S), S.Length)
  else
    Result := AnsiDecode(S);
end;
{$ENDIF} {$ENDIF}

{$IFNDEF USEYxdStr}
function Utf8Decode(p: PAnsiChar; l: Integer): JSONStringW;
var
  ps,pe: PByte;
  pd,pds: PWord;
  c: Cardinal;
begin
  if l<=0 then begin
    ps:=PByte(p);
    while ps^<>0 do Inc(ps);
    l := Integer(ps) - Integer(p);
  end;
  ps := PByte(p);
  pe := ps;
  Inc(pe, l);
  System.SetLength(Result, l);
  pd := PWord(PWideChar(Result));
  pds := pd;
  while Integer(ps)<Integer(pe) do begin
    if (ps^ and $80)<>0 then begin
      if (ps^ and $FC)=$FC then begin //4000000+
        c:=(ps^ and $03) shl 30;
        Inc(ps);
        c:=c or ((ps^ and $3F) shl 24);
        Inc(ps);
        c:=c or ((ps^ and $3F) shl 18);
        Inc(ps);
        c:=c or ((ps^ and $3F) shl 12);
        Inc(ps);
        c:=c or ((ps^ and $3F) shl 6);
        Inc(ps);
        c:=c or (ps^ and $3F);
        Inc(ps);
        c:=c-$10000;
        pd^:=$D800+((c shr 10) and $3FF);
        Inc(pd);
        pd^:=$DC00+(c and $3FF);
        Inc(pd);
      end else if (ps^ and $F8)=$F8 then begin //200000-3FFFFFF
        c:=(ps^ and $07) shl 24;
        Inc(ps);
        c:=c or ((ps^ and $3F) shl 18);
        Inc(ps);
        c:=c or ((ps^ and $3F) shl 12);
        Inc(ps);
        c:=c or ((ps^ and $3F) shl 6);
        Inc(ps);
        c:=c or (ps^ and $3F);
        Inc(ps);
        c:=c-$10000;
        pd^:=$D800+((c shr 10) and $3FF);
        Inc(pd);
        pd^:=$DC00+(c and $3FF);
        Inc(pd);
      end else if (ps^ and $F0)=$F0 then begin //10000-1FFFFF
        c:=(ps^ and $0F) shr 18;
        Inc(ps);
        c:=c or ((ps^ and $3F) shl 12);
        Inc(ps);
        c:=c or ((ps^ and $3F) shl 6);
        Inc(ps);
        c:=c or (ps^ and $3F);
        Inc(ps);
        c:=c-$10000;
        pd^:=$D800+((c shr 10) and $3FF);
        Inc(pd);
        pd^:=$DC00+(c and $3FF);
        Inc(pd);
      end else if (ps^ and $E0)=$E0 then begin //800-FFFF
        c:=(ps^ and $1F) shl 12;
        Inc(ps);
        c:=c or ((ps^ and $3F) shl 6);
        Inc(ps);
        c:=c or (ps^ and $3F);
        Inc(ps);
        pd^:=c;
        Inc(pd);
      end else if (ps^ and $C0)=$C0 then begin //80-7FF
        pd^:=(ps^ and $3F) shl 6;
        Inc(ps);
        pd^:=pd^ or (ps^ and $3F);
        Inc(pd);
        Inc(ps);
      end else
        raise Exception.Create(Format('��Ч��UTF8�ַ�:%d',[Integer(ps^)]));
    end else begin
      pd^ := ps^;
      Inc(ps);
      Inc(pd);
    end;
  end;
  System.SetLength(Result, (Integer(pd)-Integer(pds)) shr 1);
end;
{$ENDIF}

function DecodeToken(var p: PJSONChar; ADelimiter, AQuoter: JSONChar; AIgnoreSpace: Boolean): JSONString;
var
  s: PJSONChar;
begin
  if AIgnoreSpace then
    {$IFDEF JSON_UNICODE}SkipSpaceW{$ELSE}SkipSpaceA{$ENDIF}(p);
  s := p;
  while p^ <> #0 do begin
    if p^ = AQuoter then begin //���õ����ݲ����
      Inc(p);
      while p^<>#0 do begin
        if p^=#$5C then begin
          Inc(p);
          if p^<>#0 then
            Inc(p);
        end else if p^=AQuoter then begin
          Inc(p);
          if p^=AQuoter then
            Inc(p)
          else
            Break;
        end else
          Inc(p);
      end;
    end else if p^ = ADelimiter then
      Break
    else
      Inc(p);
  end;
  SetLength(Result, p-s);
  Move(s^, PJSONChar(Result)^, (p-s){$IFDEF JSON_UNICODE} shl 1{$ENDIF});
  if p^ = ADelimiter then
    Inc(p);
end;

{$IFNDEF USEYxdStr}
procedure SaveTextU(AStream: TStream; const S: AnsiString; AWriteBom: Boolean; IsUtf8: Boolean);

  procedure WriteBom;
  var
    ABom:TBytes;
  begin
    SetLength(ABom,3);
    ABom[0]:=$EF;
    ABom[1]:=$BB;
    ABom[2]:=$BF;
    AStream.WriteBuffer(ABom[0],3);
  end;

  procedure SaveAnsi;
  var
    T: AnsiString;
  begin
    T := {$IFDEF USEYxdStr}YxdStr.{$ELSE}YxdJson.{$ENDIF}Utf8Encode({$IFDEF NEXTGEN}AnsiDecode(S){$ELSE}JSONString(S){$ENDIF});
    AStream.WriteBuffer(PAnsiChar(T)^, Length(T));
  end;

begin
  if AWriteBom then
    WriteBom;
  if IsUtf8 then
    AStream.WriteBuffer(PAnsiChar(S)^, Length(S))
  else
    SaveAnsi;
end;
{$ENDIF}

{$IFNDEF USEYxdStr}
procedure SaveTextW(AStream: TStream; const S: JSONStringW; AWriteBom: Boolean);
  procedure WriteBom;
  var
    bom: Word;
  begin
    bom := $FEFF;
    AStream.WriteBuffer(bom, 2);
  end;
begin
  if AWriteBom then
    WriteBom;
  AStream.WriteBuffer(PWideChar(S)^, System.Length(S) shl 1);
end;
{$ENDIF}

{$IFNDEF USEYxdStr}
procedure SaveTextWBE(AStream: TStream; const S: JSONStringW; AWriteBom: Boolean);
var
  pw, pe: PWord;
  w: Word;
  ABuilder: TStringCatHelper;
begin
  pw := PWord(PWideChar(S));
  pe := pw;
  Inc(pe, Length(S));
  ABuilder := TStringCatHelper.Create(IntPtr(pe)-IntPtr(pw));
  try
    while IntPtr(pw)<IntPtr(pe) do begin
      w := (pw^ shr 8) or (pw^ shl 8);
      ABuilder.Cat(@w, 1);
      Inc(pw);
    end;
    if AWriteBom then
      AStream.WriteBuffer(#$FE#$FF, 2);
    AStream.WriteBuffer(ABuilder.Start^, Length(S) shl 1);
  finally
    ABuilder.Free;
  end;
end;
{$ENDIF}

{$IFNDEF USEYxdStr}
function DetectTextEncoding(const p: Pointer; L: Integer; var b: Boolean): TTextEncoding;
var
  pAnsi: PByte;
  pWide: PWideChar;
  I, AUtf8CharSize: Integer;

  function IsUtf8Order(var ACharSize:Integer):Boolean;
  var
    I: Integer;
    ps: PByte;
  const
    Utf8Masks:array [0..4] of Byte=($C0,$E0,$F0,$F8,$FC);
  begin
    ps := pAnsi;
    ACharSize := CharSizeU(PAnsiChar(ps));
    Result := False;
    if ACharSize>1 then begin
      I := ACharSize-2;
      if ((Utf8Masks[I] and ps^) = Utf8Masks[I]) then begin
        Inc(ps);
        Result:=True;
        for I := 1 to ACharSize-1 do begin
          if (ps^ and $80)<>$80 then begin
            Result:=False;
            Break;
          end;
          Inc(ps);
        end;
      end;
    end;
  end;

begin
  Result := teAnsi;
  b := false;
  if L >= 2 then begin
    pAnsi := PByte(p);
    pWide := PWideChar(p);
    b := True;
    if pWide^ = #$FEFF then
      Result := teUnicode16LE
    else if pWide^ = #$FFFE then
      Result := teUnicode16BE
    else if L >= 3 then begin
      if (pAnsi^ = $EF) and (PByte(IntPtr(pAnsi) + 1)^ = $BB) and
        (PByte(IntPtr(pAnsi) + 2)^ = $BF) then // UTF-8����
        Result := teUTF8
      else begin// ����ַ����Ƿ��з���UFT-8���������ַ���11...
        b := false;
        Result := teUTF8;//�����ļ�ΪUTF8���룬Ȼ�����Ƿ��в�����UTF-8���������
        I := 0;
        Dec(L, 2);
        while I<=L do begin
          if (pAnsi^ and $80) <> 0 then begin // ��λΪ1
            if IsUtf8Order(AUtf8CharSize) then begin
              if AUtf8CharSize>2 then//���ִ���2���ֽڳ��ȵ�UTF8���У�99%����UTF-8�ˣ������ж�
                Break;
              Inc(pAnsi,AUtf8CharSize);
              Inc(I,AUtf8CharSize);
            end else begin
              Result:=teAnsi;
              Break;
            end;
          end else begin
            if pAnsi^=0 then begin //00 xx (xx<128) ��λ��ǰ����BE����
              if PByte(IntPtr(pAnsi)+1)^<128 then begin
                Result := teUnicode16BE;
                Break;
              end;
            end else if PByte(IntPtr(pAnsi)+1)^=0 then begin//xx 00 ��λ��ǰ����LE����
              Result:=teUnicode16LE;
              Break;
            end;
            Inc(pAnsi);
            Inc(I);
          end;
        end;
      end;
    end;
  end;
end;
{$ENDIF}

procedure ExchangeByteOrder(p:PAnsiChar; l:Integer);
var
  pe: PAnsiChar;
  c: AnsiChar;
begin
  pe := p;
  Inc(pe,l);
  while IntPtr(p)<IntPtr(pe) do begin
    c := p^;
    p^ := PAnsiChar(IntPtr(p)+1)^;
    PAnsiChar(IntPtr(p)+1)^ :=c ;
    Inc(p, 2);
  end;
end;

{$IFNDEF USEYxdStr}
function LoadTextA(AStream: TStream; AEncoding: TTextEncoding): AnsiString;
var
  ASize: Integer;
  ABuffer: TBytes;
  ABomExists: Boolean;
begin
  ASize := AStream.Size - AStream.Position;
  if ASize > 0 then begin
    SetLength(ABuffer, ASize);
    AStream.ReadBuffer((@ABuffer[0])^, ASize);
    if AEncoding in [teUnknown,teAuto] then
      AEncoding := DetectTextEncoding(@ABuffer[0], ASize, ABomExists);
    if AEncoding=teAnsi then
      Result := AnsiString(ABuffer)
    else if AEncoding = teUTF8 then begin
      if ABomExists then
        Result := AnsiEncode(
          {$IFDEF USEYxdStr}YxdStr.Utf8Decode{$ELSE}Utf8Decode{$ENDIF}(@ABuffer[3], ASize-3))
      else
        Result := AnsiEncode(
          {$IFDEF USEYxdStr}YxdStr.Utf8Decode{$ELSE}Utf8Decode{$ENDIF}(@ABuffer[0], ASize));
      end
    else begin
      if AEncoding = teUnicode16BE then
        ExchangeByteOrder(@ABuffer[0],ASize);
      if ABomExists then
        Result := AnsiEncode(PWideChar(@ABuffer[2]), (ASize-2) shr 1)
      else
        Result := AnsiEncode(PWideChar(@ABuffer[0]), ASize shr 1);
    end;
  end else
    Result := '';
end;

function LoadTextU(AStream: TStream; AEncoding: TTextEncoding): AnsiString;
var
  ASize: Integer;
  ABuffer: TBytes;
  ABomExists: Boolean;
  P: PAnsiChar;
begin
  ASize := AStream.Size - AStream.Position;
  if ASize>0 then begin
    SetLength(ABuffer, ASize);
    AStream.ReadBuffer((@ABuffer[0])^, ASize);
    if AEncoding in [teUnknown, teAuto] then
      AEncoding:=DetectTextEncoding(@ABuffer[0],ASize,ABomExists)
    else if ASize>=2 then begin
      case AEncoding of
        teUnicode16LE:
          ABomExists:=(ABuffer[0]=$FF) and (ABuffer[1]=$FE);
        teUnicode16BE:
          ABomExists:=(ABuffer[1]=$FE) and (ABuffer[1]=$FF);
        teUTF8:
          begin
            if ASize>3 then
              ABomExists:=(ABuffer[0]=$EF) and (ABuffer[1]=$BB) and (ABuffer[2]=$BF)
            else
              ABomExists:=False;
          end;
      end;
    end else
      ABomExists:=False;
    if AEncoding=teAnsi then
      Result := {$IFDEF USEYxdStr}YxdStr.Utf8Encode{$ELSE}YxdJson.Utf8Encode{$ENDIF}
        (AnsiDecode(@ABuffer[0], ASize))
    else if AEncoding = teUTF8 then begin
      if ABomExists then begin
        Dec(ASize, 3);
        {$IFDEF NEXTGEN}
        Result.From(@ABuffer[0], 3, ASize);
        {$ELSE}
        SetLength(Result, ASize);
        P := @ABuffer[0];
        Inc(P, 3);
        Move(P^, PAnsiChar(@Result[1])^, ASize);
        {$ENDIF}
      end else
        Result := AnsiString(ABuffer);
    end else begin
      if AEncoding=teUnicode16BE then
        ExchangeByteOrder(@ABuffer[0],ASize);
      if ABomExists then
        Result := Utf8Encode(PWideChar(@ABuffer[2]), (ASize-2) shr 1)
      else
        Result := Utf8Encode(PWideChar(@ABuffer[0]), ASize shr 1);
      end;
    end
  else
    Result := '';
end;

function LoadTextW(AStream: TStream; AEncoding: TTextEncoding): JSONStringW;
var
  ASize: Integer;
  ABuffer: TBytes;
  ABomExists: Boolean;
begin
  ASize := AStream.Size - AStream.Position;
  if ASize>0 then begin
    SetLength(ABuffer, ASize);
    AStream.ReadBuffer((@ABuffer[0])^, ASize);
    if AEncoding in [teUnknown, teAuto] then
      AEncoding := DetectTextEncoding(@ABuffer[0], ASize, ABomExists)
    else if ASize>=2 then begin
      case AEncoding of
        teUnicode16LE:
          ABomExists:=(ABuffer[0]=$FF) and (ABuffer[1]=$FE);
        teUnicode16BE:
          ABomExists:=(ABuffer[1]=$FE) and (ABuffer[1]=$FF);
        teUTF8:
          begin
            if ASize>3 then
              ABomExists := (ABuffer[0]=$EF) and (ABuffer[1]=$BB) and (ABuffer[2]=$BF)
            else
              ABomExists := False;
          end;
      end;
    end else
      ABomExists:=False;
    if AEncoding = teAnsi then
      Result := AnsiDecode(@ABuffer[0], ASize)
    else if AEncoding = teUTF8 then begin
      if ABomExists then
        Result := Utf8Decode(@ABuffer[3], ASize-3)
      else
        Result := Utf8Decode(@ABuffer[0], ASize);
    end else begin
      if AEncoding = teUnicode16BE then
        ExchangeByteOrder(@ABuffer[0], ASize);
      if ABomExists then begin
        Dec(ASize, 2);
        SetLength(Result, ASize shr 1);
        Move(ABuffer[2], PWideChar(Result)^, ASize);
      end else begin
        SetLength(Result, ASize shr 1);
        Move(ABuffer[0], PWideChar(Result)^, ASize);
      end;
    end;
  end else
    Result := '';
end;
{$ENDIF}

{$IFNDEF USEYxdStr}{$IFDEF NEXTGEN}
{ AnsiString }
procedure AnsiString.From(p: PAnsiChar; AOffset, ALen: Integer);
begin
  SetLength(ALen);
  Inc(P, AOffset);
  Move(P^, PAnsiChar(@FValue[1])^,ALen);
end;

function AnsiString.GetChars(AIndex: Integer): AnsiChar;
begin
  if (AIndex<0) or (AIndex>=Length) then
    raise Exception.CreateFmt(SOutOfIndex,[AIndex,0,Length-1]);
  Result:=FValue[AIndex+1];
end;

class operator AnsiString.Implicit(const S: JSONStringW): AnsiString;
begin
  Result := AnsiEncode(S);
end;

class operator AnsiString.Implicit(const S: AnsiString): PAnsiChar;
begin
  Result:=PansiChar(@S.FValue[1]);
end;

function AnsiString.GetIsUtf8: Boolean;
begin
  if System.Length(FValue)>0 then
    Result:=(FValue[0]=1)
  else
    Result:=False;
end;

function AnsiString.GetLength: Integer;
begin
  //FValue[0]�����������ͣ�0-ANSI,1-UTF8��ĩβ�����ַ�����\0������
  Result := System.Length(FValue);
  if Result>=2 then
    Dec(Result,2)
  else
    Result:=0;
end;

class operator AnsiString.Implicit(const S: AnsiString): TBytes;
var
  L:Integer;
begin
  L:=System.Length(S.FValue)-1;
  System.SetLength(Result,L);
  if L>0 then
    Move(S.FValue[1],Result[0],L);
end;

procedure AnsiString.SetChars(AIndex: Integer; const Value: AnsiChar);
begin
  if (AIndex<0) or (AIndex>=Length) then
    raise Exception.CreateFmt(SOutOfIndex,[AIndex,0,Length-1]);
  FValue[AIndex+1]:=Value;
end;

procedure AnsiString.SetLength(const Value: Integer);
begin
  if Value<0 then begin
    if System.Length(FValue)>0 then
      System.SetLength(FValue,1)
    else begin
      System.SetLength(FValue,1);
      FValue[0]:=0;//ANSI
    end;
  end else begin
    System.SetLength(FValue,Value+2);
    FValue[Value+1]:=0;
  end;
end;

class operator AnsiString.Implicit(const ABytes: TBytes): AnsiString;
var
  L:Integer;
begin
  L:=System.Length(ABytes);
  Result.Length:=L;
  if L>0 then
    Move(ABytes[0],Result.FValue[1],L);
end;

class operator AnsiString.Implicit(const S: AnsiString): JSONStringW;
begin
  Result := AnsiDecode(S);
end;
{$ENDIF} {$ENDIF}

type
  {$IFDEF JSON_UNICODE}
  PIntChar = PInteger;
  PInt4Char = PInt64;
  {$ELSE}
  PIntChar = PWord;
  PInt4Char = PInteger;
  {$ENDIF}

procedure CatValue(ABuilder: TStringCatHelper; const AValue: JSONString; ADoEscape: Boolean);
var
  ps, p: PJSONChar;
  pd, pLast: PChar;
  ADelta: Integer;
  w: Word;
begin
  ABuilder.IncSize(Length(AValue));
  ps := PJSONChar(AValue);
  p := ps;
  pd := ABuilder.Current;
  pLast := ABuilder.EndChar;
  while p^ <> #0 do begin
    if IntPtr(pLast) - IntPtr(pd) < 12 then begin // ����������� \uxxxx
      ABuilder.Current := pd;
      ADelta := Length(AValue) - ((IntPtr(p) - IntPtr(ps)) shr 1);
      // �����ʣ��һ����ת���ַ�����ADoEscapeΪtrue����������Ҫ6���ַ���λ��
      if ADoEscape and (ADelta < 6) then
        ADelta := 6;
      ABuilder.IncSize(ADelta);
      pd := ABuilder.Current;
      pLast := ABuilder.EndChar;
      ps := p;
    end;

    case p^ of
      #7:
        begin
          PIntChar(pd)^ := PIntChar(Char7)^;
          Inc(pd, 2);
        end;
      #8:
        begin
          PIntChar(pd)^ := PIntChar(Char8)^;
          Inc(pd, 2);
        end;
      #9:
        begin
          PIntChar(pd)^ := PIntChar(Char9)^;
          Inc(pd, 2);
        end;
      #10:
        begin
          PIntChar(pd)^ := PIntChar(Char10)^;
          Inc(pd, 2);
        end;
      #11:
        begin
          PIntChar(pd)^ := PIntChar(Char11)^;
          Inc(pd, 2);
        end;
      #12:
        begin
          PIntChar(pd)^ := PIntChar(Char12)^;
          Inc(pd, 2);
        end;
      #13:
        begin
          PIntChar(pd)^ := PIntChar(Char13)^;
          Inc(pd, 2);
        end;
      '\':
        begin
          PIntChar(pd)^ := PIntChar(CharBackslash)^;
          Inc(pd, 2);
        end;
      '"':
        begin
          PIntChar(pd)^ := PIntChar(CharQuoter)^;
          Inc(pd, 2);
        end;
      else begin
         if ps^ < #$1F then begin
          PInt4Char(pd)^ := PInt4Char(CharCode)^;
          Inc(pd, 4);
          if ps^ > #$F then
            pd^ := CharNum1^
          else
            pd^ := CharNum0^;
          Inc(pd);
          pd^ := LowerHexChars[Ord(p^) and $0F];
          Inc(pd);
        end else if (p^ <= #$7E) or (not ADoEscape) then begin//Ӣ���ַ���
          pd^ := p^;
          Inc(pd);
        end else begin
          PIntChar(pd)^ := PIntChar(CharEscape)^;
          Inc(pd, 2);
          {$IFDEF JSON_UNICODE}
          w := PWord(p)^;
          {$ELSE}
          w := PWord(AnsiDecode(p, 2))^;
          Inc(P);
          {$ENDIF}
          pd^ := LowerHexChars[(w shr 12) and $0F];
          Inc(pd);
          pd^ := LowerHexChars[(w shr 8) and $0F];
          Inc(pd);
          pd^ := LowerHexChars[(w shr 4) and $0F];
          Inc(pd);
          pd^ := LowerHexChars[w and $0F];
          Inc(pd);
        end;
      end;
    end;
    Inc(p);
  end;
  ABuilder.Current := pd;
end;

procedure StrictJsonTime(ABuilder: TStringCatHelper; ATime:TDateTime);
const
  JsonTimeStart: PJSONChar = '/DATE(';
  JsonTimeEnd:   PJSONChar = ')/';
  UnixDelta: Int64 = 25569;
var
  MS: Int64; //ʱ����Ϣ������
begin
  MS := Trunc((ATime - UnixDelta) * 86400000);
  ABuilder.Cat(JsonTimeStart, 6);
  if (JsonTimeZone >= -12) and (JsonTimeZone <= 12) then begin
    Dec(MS, 3600000 * JsonTimeZone);
    if JsonDatePrecision = jdpSecond then
      MS := MS div 1000;
    ABuilder.Cat(IntToStr(MS));
    if JsonTimeZone >= 0 then
      ABuilder.Cat('+');
    ABuilder.Cat(JsonTimeZone);
  end else
    ABuilder.Cat(IntToStr(MS));
  ABuilder.Cat(JsonTimeEnd, 2);
end;

function ValueAsDateTime(const DateFormat, TimeFormat, DateTimeFormat: JSONString; const AValue: TDateTime): JSONString;
var
  ADate: Integer;
begin
  ADate := Trunc(AValue);
  if SameValue(ADate, 0) then begin //DateΪ0����ʱ��
    if SameValue(AValue, 0) then
      Result := FormatDateTime(DateFormat, AValue)
    else
      Result := FormatDateTime(TimeFormat, AValue);
  end else begin
    if SameValue(AValue-ADate, 0) then
      Result := FormatDateTime(DateFormat, AValue)
    else
      Result := FormatDateTime(DateTimeFormat, AValue);
  end;
end;

{$IFNDEF USERTTI}
const
  CSBlobs: JSONString = '[blob]<';
  CSBlobBase64: PJSONChar = '[BS]'; //ʹ��Base64����Blobʱ��ʶ��ǰ׺
  CSBlobsLen: Integer = 7;
  CSBlobBase64Len: Integer = 4;
var
  CSPBlobs: PJSONChar;
  CSPBlobs2, CSPBlobs3: PJSONChar;

function IsBlob(P: PJSONChar; HighL: Integer): Boolean;
begin
  {$IFDEF JSON_UNICODE}
  Result := (HighL >= (CSBlobsLen shl 1))
      and (PInt64(p)^ = PInt64(CSPBlobs)^)
      and (PDWORD(IntPtr(P)+8)^ = PDWORD(CSPBlobs2)^)
      and (PWORD(IntPtr(P)+12)^ = PWORD(CSPBlobs3)^)
      and (PJSONChar(IntPtr(P) + HighL - 1)^ = '>');
  {$ELSE}
  Result := (HighL >= CSBlobsLen)
      and (PDWORD(p)^ = PDWORD(CSPBlobs)^)
      and (PWORD(IntPtr(P)+4)^ = PWORD(CSPBlobs2)^)
      and (PByte(IntPtr(P)+6)^ = PByte(CSPBlobs3)^)
      and (PJSONChar(IntPtr(P) + HighL)^ = '>');
  {$ENDIF}
end;

{$IFDEF USEBlob}
function EncodeBase64(const Input: Pointer; Size: Integer): string;
{$IFDEF JSON_UNICODE}
var
  FBase64: TBase64Encoding;
begin
  FBase64 := TBase64Encoding.Create(-1);
  try
    Result := FBase64.EncodeBytesToString(Input, Size);
  finally
    FreeAndNil(FBase64);
  end;
{$ELSE}
begin
  Result := string(Base64Encode(Input^, Size));
{$ENDIF}
end;
{$ENDIF}

function BlobStringToStream(Data: Pointer; Size: Integer): TMemoryStream; overload;
var
  I: Integer;
  {$IFDEF JSON_UNICODE}
  BSStream: TPointerStream;
  {$ENDIF}
  p: {$IFDEF JSON_UNICODE}PByte{$ELSE}PAnsiChar{$ENDIF};
  {$IFNDEF JSON_UNICODE}
  BStmp: JSONString;
  {$ENDIF}
  Buf: TBytes;
begin
  Result := nil;
  P := Data;
  I := Size - 1;
  {$IFDEF JSON_UNICODE}
  Inc(P, CSBlobsLen shl 1);
  if (I >= (CSBlobsLen + CSBlobBase64Len) shl 1) and
    (PInt64(p)^ = PInt64(CSBlobBase64)^) then
  begin
    Inc(p, CSBlobBase64Len shl 1);
    BSStream := TPointerStream.Create;
    BSStream.SetPointer(p, I-((CSBlobsLen shl 1)+1)-8);
    BSStream.Position := 0;
    Result := TMemoryStream.Create;
    try
      DecodeStream(BSStream, Result);
    finally
      BSStream.Free;
    end;
  end else begin
    {$IFDEF USEYxdStr}YxdStr{$ELSE}YxdJson{$ENDIF}.HexToBin(Pointer(p),
      (I-(CSBlobsLen shl 1)-1) shr 1, Buf);
    if Length(Buf) > 0 then begin
      Result := TMemoryStream.Create;
      Result.WriteBuffer(Buf[0], Length(Buf));
    end;
  end;
  {$ELSE}
  Inc(p, CSBlobsLen);
  if (I >= (CSBlobsLen + CSBlobBase64Len)) and (PDWORD(p)^ = PDWORD(CSBlobBase64)^) then begin
    Inc(p, CSBlobBase64Len);
    BStmp := Base64Decode(p^, I-CSBlobsLen-CSBlobBase64Len);
    Result := TMemoryStream.Create;
    Result.WriteBuffer(BSTmp[1], Length(BStmp));
  end else begin
    {$IFDEF USEYxdStr}YxdStr{$ELSE}YxdJson{$ENDIF}.HexToBin(p, Size-CSBlobsLen, Buf);
    if Length(Buf) > 0 then begin
      Result := TMemoryStream.Create;
      Result.WriteBuffer(Buf[0], Length(Buf));
    end;
  end;
  {$ENDIF}
end;

function BlobStreamToString(const Data: Pointer;
  const Size: Int64; Base64Blob: Boolean): JSONString; overload;
begin
  {$IFDEF JSON_UNICODE}
  if Base64Blob then begin
    Result := CSBlobs + CSBlobBase64 + JSONString(EncodeBase64(Data, Size)) + '>';
  end else
    Result := (CSBlobs + {$IFDEF USEYxdStr}YxdStr{$ELSE}YxdJson{$ENDIF}.BinToHex(Data, Size) + '>');
  {$ELSE}
  if Base64Blob then
    Result := (CSBlobs + CSBlobBase64 + Base64Encode(Data^, Size) + '>')
  else begin
    Result := (CSBlobs + {$IFDEF USEYxdStr}YxdStr{$ELSE}YxdJson{$ENDIF}.BinToHex(Data, Size) + '>');
  end;
  {$ENDIF}
end;

function BlobStreamToString(const Data: TBytes; Base64Blob: Boolean): JSONString; overload; {$IFDEF USEINLINE}inline;{$ENDIF}
begin
  if Length(Data) > 0 then begin
    Result := BlobStreamToString(@Data[0], Length(Data), Base64Blob)
  end else
    Result := '';
end;
{$ENDIF} 

{ JSONValue }

procedure JSONValue.CopyValue(ASource: PJSONValue);
var
  l: Integer;
begin
  L := Length(ASource.FValue);
  FType := ASource.FType;
  SetLength(FValue, L);
  if L > 0 then
    Move(ASource.FValue[0], FValue[0], L);
end;

procedure JSONValue.Free;
begin
  if (FType = jdtObject) and (FObject <> nil) then begin
    {$IFNDEF UsePool}
    FObject.Free;
    {$ELSE}
    if FObject.IsJSONArray then
      FreeJsonArray(FObject)
    else
      FreeJsonObject(FObject);
    {$ENDIF}
  end;
end;

function _StrToBoolDef(const Value: string): Boolean;
begin
  Result := (Value = 'true') or (Value = 'yes') or (Value = '1');
end;

function JSONValue.GetAsBoolean: Boolean;
begin
  if High(FValue) > -1 then begin
    case FType of
      jdtNull: Result := False;
      jdtString: Result := _StrToBoolDef(LowerCase(AsString));
      jdtInteger: Result := AsInt64 <> 0;
      jdtObject: Result := FObject <> nil;
      jdtFloat, jdtDateTime: Result := AsFloat <> 0;
    else
      Result := PBoolean(@FValue[0])^;
    end;
  end else Result := False;
end;

function JSONValue.GetAsByte: Byte;
begin
  Result := GetAsInt64();
end;

function JSONValue.GetAsDateTime: TDateTime;
begin
  if (FType = jdtFloat) or (FType = jdtDateTime) then
    Result := GetAsFloat
  else if FType = jdtString then begin
    if not(ParseDateTime(PJSONChar(GetString), Result) or
      ParseJsonTime(PJSONChar(GetString), Result) or ParseWebTime(PJSONChar(GetString), Result)) then
      raise Exception.Create(Format(SBadConvert, [JsonTypeName[Integer(FType)], JsonTypeName[Integer(jdtDateTime)]]))
  end else if FType = jdtInteger then
    Result := AsInt64
  else
    raise Exception.Create(Format(SBadConvert, [JsonTypeName[Integer(FType)], JsonTypeName[Integer(jdtDateTime)]]));
end;

function JSONValue.GetAsDouble: Double;
begin
  Result := GetAsFloat;
end;

function JSONValue.GetAsFloat: Extended;
begin
  case FType of
    jdtFloat, jdtDateTime:
      begin
        if Length(FValue) = 8 then
          Result := PDouble(@FValue[0])^
        else if Length(FValue) >= SizeOf(Extended) then
          Result := PExtended(@FValue[0])^
        else
          Result := 0;
      end;
    jdtString:
      Result := StrToFloatDef(GetString(), 0);
    jdtInteger:
      begin
        case High(FValue) of
          3: Result := PInteger(@FValue[0])^;
          7: Result := PInt64(@FValue[0])^;
          0: Result := PShortInt(@FValue[0])^;
          1: Result := PSmallInt(@FValue[0])^;
        else
          Result := 0;
        end;
      end;
    jdtBoolean:
      Result := Integer(AsBoolean);
  else
    Result := 0;
  end;
end;

function JSONValue.GetAsInt64: Int64;
begin
  case FType of
    jdtInteger:
      begin
        case High(FValue) of
          3: Result := PInteger(@FValue[0])^;
          7: Result := PInt64(@FValue[0])^;
          0: Result := PShortInt(@FValue[0])^;
          1: Result := PSmallInt(@FValue[0])^;
        else
          Result := 0;
        end;
      end;
    jdtString:
      Result := StrToIntDef(GetString(), 0);
    jdtFloat:
      begin
        if Length(FValue) = 8 then
          Result := Trunc(PDouble(@FValue[0])^)
        else if Length(FValue) >= SizeOf(Extended) then
          Result := Trunc(PExtended(@FValue[0])^)
        else
          Result := 0;
      end;
    jdtDateTime:
      Result := Trunc(AsDateTime);
    jdtBoolean:
      Result := Integer(AsBoolean);
  else
    Result := 0;
  end;
end;

function JSONValue.GetAsInteger: Integer;
begin
  Result := GetAsInt64;
end;

function JSONValue.GetAsJSONArray: JSONArray;
begin
  if (FObject <> nil) and (FObject.GetIsArray) then
    Result := JSONArray(FObject)
  else
    Result := nil;
end;

function JSONValue.GetAsJSONObject: JSONObject;
begin
  if (FObject <> nil) and (not FObject.GetIsArray) then
    Result := JSONObject(FObject)
  else
    Result := nil;
end;

function JSONValue.GetAsStream: TStream;

  function GetPointerStream(const Value: TBytes): TPointerStream;
  begin
    Result := TPointerStream.Create();
    if Length(Value) > 0 then
      Result.SetPointer(@Value[0], Length(Value));
  end;

begin
  if (FType = jdtString) and (Length(FValue) > 4) then
    ParseBlobData();
  Result := GetPointerStream(FValue);
end;

function JSONValue.GetAsString: JSONString;
begin
  Result := ToString();
end;

function JSONValue.GetStringEx(AEncoding: TTextEncoding): string;
var
  Stream: TPointerStream;
begin
  if Length(FValue) = 0 then
    Result := ''
  else begin
    Stream := TPointerStream.Create(@FValue[0], Length(FValue));
    try
      Result := string(LoadTextA(Stream, AEncoding));
    finally
      FreeAndNil(Stream);
    end;
  end;
end;

function JSONValue.ParseBlobData: boolean;
var
  S: TMemoryStream;
begin
  Result := False;
  if {$IFDEF USERTTI}TYxdSerialize.{$ELSE}YxdJson.{$ENDIF}IsBlob(@FValue[0], High(FValue)) then begin
    S := {$IFDEF USERTTI}TYxdSerialize.{$ENDIF}BlobStringToStream(@FValue[0], Length(FValue));
    if Assigned(S) then begin
      SetBytes(S.Memory, S.Position);
      Result := True;
      FreeAndNil(S);
    end;
  end;
end;

function JSONValue.GetAsVariant: Variant;
var
  I: Integer;
begin
  case FType of
    jdtString: Result := AsString;
    jdtInteger: Result := AsInt64;
    jdtFloat: Result := AsFloat;
    jdtBoolean: Result := AsBoolean;
    jdtDateTime: Result := AsFloat;
    jdtObject: 
      begin
        if Assigned(FObject) then begin
          Result := VarArrayCreate([0, FObject.Count - 1], varVariant);
          for I := 0 to FObject.Count - 1 do
            Result[I] := FObject.Items[I].AsVariant;
        end else
          Result := varEmpty;
      end;
    {$IFDEF USEBlob}
    jdtBlob: Result := ReadVarArrayFromStream(AsStream, -1);
    {$ENDIF}
  else
    Result := varEmpty;
  end;
end;

function JSONValue.GetAsWord: Word;
begin
  Result := GetAsInt64;
end;

function JSONValue.GetIsBlob: Boolean;
begin
  if (FType = jdtBytes) then
    Result := True
  else if (FType = jdtString) and (Length(FValue) > 4) and {$IFDEF USERTTI}TYxdSerialize.{$ELSE}YxdJson.{$ENDIF}IsBlob(@FValue[0], High(FValue)) then begin
    Result := True
  end else
    Result := False;
end;

function JSONValue.GetIsDateTime: Boolean;
var
  ATime: TDateTime;
begin
  Result := FType = jdtDateTime;
  if (not Result) and (FType = jdtString) and (Length(FValue) > 0) then begin
    Result := ParseDateTime(@FValue[0], ATime) or
      ParseJsonTime(@FValue[0], ATime) or
      ParseWebTime(@FValue[0], ATime);
  end;
end;

function JSONValue.GetObject: JSONBase;
begin
  if FType = jdtObject then
    Result := FObject
  else
    Result := nil;
end;

function JSONValue.GetPath(const ADelimiter: JSONChar): JSONString;
begin
  if Assigned(FObject) then
    Result := FObject.GetPath(ADelimiter)
  else
    Result := '';
end;

function JSONValue.GetSize: Cardinal;
begin
  Result := Length(FValue);
end;

function JSONValue.GetString: string;
begin
  {$IFDEF JSON_UNICODE}
  SetString(Result, PJSONChar(FValue), System.Length(FValue) shr 1);
  {$ELSE}
  Result := JSONString(FValue);
  SetLength(Result, System.Length(FValue));
  {$ENDIF}
end;

procedure JSONValue.SetAsBoolean(const Value: Boolean);
begin
  SetLength(FValue, SizeOf(Value));
  PBoolean(@FValue[0])^ := Value;
  FType := jdtBoolean;
end;

procedure JSONValue.SetAsByte(const Value: Byte);
begin
  SetLength(FValue, SizeOf(Value));
  FValue[0] := Value;
  FType := jdtInteger;
end;

procedure JSONValue.SetAsBytes(const Value: TBytes);
begin
  FValue := Value;
  FType := jdtBytes;
end;

procedure JSONValue.SetAsDateTime(const Value: TDateTime);
begin
  SetLength(FValue, SizeOf(Value));
  PDouble(@FValue[0])^ := Value;
  FType := jdtDateTime;
end;

procedure JSONValue.SetAsDouble(const Value: Double);
begin
  SetLength(FValue, SizeOf(Value));
  PDouble(@FValue[0])^ := Value;
  FType := jdtFloat;
end;

procedure JSONValue.SetAsDWORD(const Value: Cardinal);
begin
  SetLength(FValue, SizeOf(Value));
  PCardinal(@FValue[0])^ := Value;
  FType := jdtInteger;
end;

procedure JSONValue.SetAsFloat(const Value: Extended);
begin
  SetLength(FValue, SizeOf(Value));
  PExtended(@FValue[0])^ := Value;
  FType := jdtFloat;
end;

procedure JSONValue.SetAsInt64(const Value: Int64);
begin
  SetLength(FValue, SizeOf(Value));
  PInt64(@FValue[0])^ := Value;
  FType := jdtInteger;
end;

procedure JSONValue.SetAsInteger(const Value: Integer);
begin
  SetLength(FValue, SizeOf(Value));
  PInteger(@FValue[0])^ := Value;
  FType := jdtInteger;
end;

procedure JSONValue.SetAsJSONArray(const Value: JSONArray);
begin
  SetLength(FValue, 0);
  FObject := Value;
  FType := jdtObject;
end;

procedure JSONValue.SetAsJSONObject(const Value: JSONObject);
begin
  SetLength(FValue, 0);
  FObject := Value;
  FType := jdtObject;
end;

procedure JSONValue.SetAsStream(const Value: TStream);
begin
  SetBytes(Value);
end;

procedure JSONValue.SetAsString(const Value: JSONString);
begin
  if Length(Value) > 0 then begin
    {$IFDEF JSON_UNICODE}
    SetLength(FValue, (Length(Value) shl 1));
    Move(PJSONChar(Value)^, FValue[0], Length(Value) shl 1);
    {$ELSE}
    //SetLength(FValue, (Length(Value) + 1));
    SetLength(FValue, Length(Value));
    Move(Value[1], FValue[0], Length(Value));
    {$ENDIF}
  end else
    SetLength(FValue, 0);
  FType := jdtString;
end;

procedure JSONValue.SetAsVariant(const Value: Variant);

  procedure SetVariantArray();
  var
    I: Integer;
    P: JSONBase;
  begin
    if Length(FValue) <> 0 then SetLength(FValue, 0);
    if (Assigned(FObject)) and (not FObject.GetIsArray) then begin
      P := FObject.FParent;
      FreeJsonObject(FObject);
    end else
      P := nil;
    if not Assigned(FObject) then begin
      FObject := NewJsonArray();
      FObject.FParent := P;
    end else
      FObject.Clear;
    FType := jdtObject;
    FObject.FValue := @Self;
    for I := VarArrayLowBound(Value, VarArrayDimCount(Value))
      to VarArrayHighBound(Value, VarArrayDimCount(Value)) do
      JSONArray(FObject).add(Value[I]);
  end;
  
begin
  case FindVarData(Value)^.VType of
    varBoolean: SetAsBoolean(Value);
    varByte: SetAsByte(Value);
    varWord: SetAsWord(Value);
    varSmallint: SetAsInteger(Value);
    varInteger,
    varShortInt: SetAsInteger(Value);
    varLongWord: SetAsDWORD(Value);
    varInt64: SetAsInt64(Value);
    varSingle: SetAsDouble(Value);
    varDouble: SetAsDouble(Value);
    varDate: SetAsDateTime(Value);
    varCurrency: SetAsFloat(Value);
    varOleStr, varString: SetAsString(VarToStrDef(Value, ''));
    else begin
      if VarIsArray(Value) then begin
        SetVariantArray();
      end else begin
        SetLength(FValue, 0);
        FType := jdtNull;
      end;
    end;
  end;
end;

procedure JSONValue.SetAsWord(const Value: Word);
begin
  SetLength(FValue, SizeOf(Value));
  PWord(@FValue[0])^ := Value;
  FType := jdtInteger;
end;

procedure JSONValue.SetBytes(Source: TStream; IsAll: Boolean);
var
  LastPosition: Int64;
begin
  if Assigned(Source) then begin
    if IsAll then begin
      SetLength(FValue, Source.Size);
      if Length(FValue) > 0 then begin
        Source.Position := 0;
        Source.ReadBuffer((@FValue[0])^, Length(FValue));
      end;
    end else begin
      LastPosition := Source.Position;
      SetLength(FValue, Source.Size - LastPosition);
      if Length(FValue) > 0 then
        Source.ReadBuffer((@FValue[0])^, Length(FValue));
      Source.Position := LastPosition;
    end;
  end else
    SetLength(FValue, 0);
  FType := jdtBytes;
end;

procedure JSONValue.SetBytes(const Data: Pointer; ASize: NativeInt);
begin
  SetLength(FValue, ASize);
  if ASize > 0 then
    Move(Data^, FValue[0], ASize);
  FType := jdtBytes;
end;

procedure JSONValue.SetVariantToStream(const Value: Variant);
var
  S: TMemoryStream;
begin
  Free();
  S := TMemoryStream.Create;
  WriteVarArrayToStream(Value, S);
  AsStream := S;
end;

function JSONValue.GetVariantFormStream(): Variant;
begin
  Result := ReadVarArrayFromStream(AsStream);
end;

{$IFDEF JSON_RTTI}
function JSONValue.ToObjectValue: TValue;
begin
  Result := TYxdSerialize.writeToValue(@Self);
end;
{$ENDIF}

function BoolToStr(const v: Boolean): JSONString; {$IFDEF USEINLINE}inline;{$ENDIF}
begin
  if v then Result := 'true' else Result := 'false';
end;

function FloatToStr(const value: Extended): string; {$IFDEF USEINLINE}inline;{$ENDIF}
var
  Buffer: array[0..63] of Char;
  P: PChar;
  I: Integer;
begin
  I := FloatToText(Buffer, Value, fvExtended, ffGeneral, 15, 0);
  P := StrScan(@Buffer[0], '.');
  if (P <> nil) then begin
    if I - (P - @Buffer[0] + 1) > JsonFloatDigits then begin
      I := P - @Buffer[0] + JsonFloatDigits;
      while Buffer[i] = '0' do Dec(I);
      SetString(Result, Buffer, I + 1)
    end else
      SetString(Result, Buffer, I);
  end else
    SetString(Result, Buffer, I);
end;

function FloatToStrEx(const Value: Extended): string;
var
  Buffer: array[0..63] of Char;
begin
  SetString(Result, Buffer, FloatToText(Buffer, Value, fvExtended,
    ffGeneral, 15, 0));
end;

procedure WriteVarArrayToStream(pvVar: Variant; pvStream: TStream);
var
  L: Integer;
  p: PByte;
begin
  if not Assigned(pvStream) then
    Exit;
  L := VarArrayHighBound(pvVar, 1) + 1;
  p := VarArrayLock(pvVar);
  pvStream.Write(p^, L);
  VarArrayUnlock(pvVar);
end;

function ReadVarArrayFromStream(pvStream:TStream; pvSize: Integer): Variant;
var
  L: Integer;
  p:PByte;
begin
  if not Assigned(pvStream) then begin
    Result := Null;
    Exit;
  end;
  L := pvSize;
  if L <= 0 then begin
    pvStream.Position := 0;
    L := pvStream.Size;
  end;
  Result := VarArrayCreate([0, L - 1], varByte);
  p := VarArrayLock(Result);
  pvStream.Read(p^, L);
  VarArrayUnlock(Result);
end;

function JSONValue.ToString(AIndent: Integer; ADoEscape: Boolean): JSONString;
begin
  case FType of
    jdtString:
      Result := GetString();
    jdtInteger:
      Result := IntToStr(AsInteger);
    jdtFloat:
      if JsonFloatDigits <= 0 then
        Result := FloatToStrEx(AsFloat)
      else
        Result := FloatToStr(AsFloat);
    jdtBoolean:
      Result := BoolToStr(AsBoolean);
    jdtObject:
      Result := JSONBase.Encode(FObject, AIndent, ADoEscape);
    jdtDateTime:
      Result := ValueAsDateTime(JsonDateFormat, JsonTimeFormat, JsonDateTimeFormat, AsDateTime);
    jdtBytes:
      Result := {$IFDEF USERTTI}TYxdSerialize.{$ENDIF}BlobStreamToString(AsBytes, JsonBlobBase64);
    jdtNull, jdtUnknown:
      Result := 'null';
  end;
end;

function JSONValue.TryAsDatetime(const DefaultValue: TDateTime): TDateTime;
begin
  if (FType <> jdtNull) and (Length(FValue) > 0) then begin
    try
      Result := AsDateTime
    except
      Result := DefaultValue;
    end;
  end else
    Result := DefaultValue;
end;

function JSONValue.ToString: JSONString;
begin
  Result := ToString(0);
end;

procedure JSONValue.Clear();
begin
  Free();
  FType := jdtUnknown;
  FName := '';
  FNameHash := 0;
  SetLength(FValue, 0);
  FObject := nil;
end;

{ JSONEnumerator }

constructor JSONEnumerator.Create(AList: JSONBase);
begin
  FList := AList;
  FIndex := -1;
end;

function JSONEnumerator.GetCurrent: PJSONValue;
begin
  Result := FList[FIndex];
end;

function JSONEnumerator.MoveNext: Boolean;
begin
  if FIndex < FList.Count - 1 then begin
    Inc(FIndex);
    Result := True;
  end else
    Result := False;
end;

{ JSONBase }

procedure JSONBase.Assign(ANode: JSONBase);
begin
  Self.parse(ANode.toString());
end;

class procedure JSONBase.BuildJsonString(ABuilder: TStringCatHelper; var p: PJSONChar);
var
  AQuoter: JSONChar;
  ps: PJSONChar;
begin
  ABuilder.Position := 0;
  if (p^='"') or (p^='''') then begin
    AQuoter := p^;
    Inc(p);
    ps := p;
    while p^<>#0 do begin
      if (p^ = AQuoter) then begin
        if ps <> p then
          ABuilder.Cat(ps, p-ps);
        if p[1] = AQuoter then begin
          ABuilder.Cat(AQuoter);
          Inc(p, 2);
          ps := p;
        end else begin
          Inc(p);
          {$IFDEF JSON_UNICODE}SkipSpaceW{$ELSE}SkipSpaceA{$ENDIF}(p);
          ps := p;
          Break;
        end;
      end else if p^='\' then begin
        if ps<>p then
          ABuilder.Cat(ps, p-ps);
        {$IFDEF JSON_UNICODE}
        ABuilder.Cat(CharUnescape(p));
        {$ELSE}
        CharUnescape(ABuilder, p);
        {$ENDIF}
        ps := p;
      end else
        Inc(p);
    end;
    if ps <> p then
      ABuilder.Cat(ps, p-ps);
  end else begin
    while p^<>#0 do begin
      if (p^=':') or (p^=']') or (p^=',') or (p^='}') then
        Break
      else
        ABuilder.Cat(p,1);
      Inc(p);
    end
  end;
end;

{$IFDEF JSON_UNICODE}
class function JSONBase.CharUnescape(var p: PJSONChar): JSONChar;
{$ELSE}
class procedure JSONBase.CharUnescape(ABuilder: TStringCatHelper; var p: PJSONChar);
{$ENDIF}

  function DecodeOrd: Integer;
  var
    C:Integer;
  begin
    Result := 0;
    C := 0;
    while (p^<>#0) and (C<4) do begin
      if IsHexChar(p^) then
        Result := (Result shl 4) + HexValue(p^)
      else
        Break;
      Inc(p);
      Inc(C);
    end
  end;

begin
  if p^=#0 then begin
    {$IFDEF JSON_UNICODE} Result := #0; {$ENDIF}
    Exit;
  end;
  if p^ <> '\' then begin
    {$IFDEF JSON_UNICODE}Result := p^;{$ELSE}ABuilder.Cat(p^);{$ENDIF}
    Inc(p);
    Exit;
  end;
  Inc(p);
  case p^ of
    'b':
      begin
        {$IFDEF JSON_UNICODE}Result := #8;{$ELSE}ABuilder.Cat(#8);{$ENDIF}
        Inc(p);
      end;
    't':
      begin
        {$IFDEF JSON_UNICODE}Result := #9;{$ELSE}ABuilder.Cat(#9);{$ENDIF}
        Inc(p);
      end;
    'n':
      begin
        {$IFDEF JSON_UNICODE}Result := #10;{$ELSE}ABuilder.Cat(#10);{$ENDIF}
        Inc(p);
      end;
    'f':
      begin
        {$IFDEF JSON_UNICODE}Result := #12;{$ELSE}ABuilder.Cat(#12);{$ENDIF}
        Inc(p);
      end;
    'r':
      begin
        {$IFDEF JSON_UNICODE}Result := #13;{$ELSE}ABuilder.Cat(#13);{$ENDIF}
        Inc(p);
      end;
    '\':
      begin
        {$IFDEF JSON_UNICODE}Result := '\';{$ELSE}ABuilder.Cat('\');{$ENDIF}
        Inc(p);
      end;
    '''':
      begin
        {$IFDEF JSON_UNICODE}Result := '''';{$ELSE}ABuilder.Cat('''');{$ENDIF}
        Inc(p);
      end;
    '"':
      begin
        {$IFDEF JSON_UNICODE}Result := '"';{$ELSE}ABuilder.Cat('"');{$ENDIF}
        Inc(p);
      end;
    'u':
      begin
        //\uXXXX
        if IsHexChar(p[1]) and IsHexChar(p[2]) and IsHexChar(p[3]) and IsHexChar(p[4]) then begin
          {$IFDEF JSON_UNICODE}
          Result := JSONChar((HexValue(p[1]) shl 12) or (HexValue(p[2]) shl 8) or
            (HexValue(p[3]) shl 4) or HexValue(p[4]));
          {$ELSE}
          ABuilder.Cat(JSONString(WideChar((HexValue(p[1]) shl 12) or (HexValue(p[2]) shl 8) or
            (HexValue(p[3]) shl 4) or HexValue(p[4]))));
          {$ENDIF}
          Inc(p, 5);
        end else
          raise Exception.CreateFmt(SCharNeeded, ['0-9A-Fa-f', StrDup(p,0,4)]);
      end;
    '/':
      begin
        {$IFDEF JSON_UNICODE}Result := '/';{$ELSE}ABuilder.Cat('/');{$ENDIF}
        Inc(p);
      end
    else begin
      if StrictJson then
        raise Exception.CreateFmt(SCharNeeded, ['btfrn"u''/', StrDup(p,0,4)])
      else begin
        {$IFDEF JSON_UNICODE}Result := p^;{$ELSE}ABuilder.Cat(p^);{$ENDIF}
        Inc(p);
      end;
    end;
  end;
end;

procedure JSONBase.Clear;
var
  I: Integer;
  Item: PJSONValue;
begin
  if FItems.Count > 0 then begin
    for I := 0 to FItems.Count - 1 do begin
      Item := FItems.Items[i];
      if (Item <> nil) then begin
        Item.Free;
        FreeJsonValue(Item);
      end;
    end;
    FItems.Clear;
  end;
end;

function JSONBase.Copy: JSONBase;
begin
  if GetIsArray then
    Result := JSONBase.ParseArray(ToString(0))
  else
    Result := JSONBase.ParseObject(ToString(0));
end;

{$IFDEF UNICODE}
function JSONBase.CopyIf(const ATag: Pointer; AFilter: JSONFilterEventA): JSONBase;

  procedure NestCopy(AParentSource, AParentDest: JSONBase);
  var
    Accept: Boolean;
    AChildSource, AChildDest: PJSONValue;
    I: Integer;
  begin
    for I := 0 to AParentSource.Count - 1 do begin
      Accept := True;
      AChildSource := AParentSource[I];
      AFilter(Self, AChildSource, Accept, ATag);
      if Accept then begin
        if Assigned(AChildSource.FObject) and (AChildSource.FType = jdtObject) then begin
          if AChildSource.FObject.GetIsArray then
            NestCopy(AChildSource.FObject, AParentDest.NewChildArray(AChildSource.FName))
          else
            NestCopy(AChildSource.FObject, AParentDest.NewChildObject(AChildSource.FName))
        end else begin
          AChildDest := JSONObject(AParentDest).add(AChildSource.FName);
          AChildDest.CopyValue(AChildSource);
        end;
      end;
    end;
  end;

begin
  if Assigned(AFilter) then begin
    if GetIsArray then
      Result := NewJsonArray()
    else
      Result := NewJsonObject();
    NestCopy(Self, Result);
  end else
    Result := Copy;
end;
{$ENDIF}

function JSONBase.CopyIf(const ATag: Pointer; AFilter: JSONFilterEvent): JSONBase;

  procedure NestCopy(AParentSource, AParentDest: JSONBase);
  var
    Accept: Boolean;
    AChildSource, AChildDest: PJSONValue;
    I: Integer;
  begin
    for I := 0 to AParentSource.Count - 1 do begin
      Accept := True;
      AChildSource := AParentSource[I];
      AFilter(Self, AChildSource, Accept, ATag);
      if Accept then begin
        if Assigned(AChildSource.FObject) and (AChildSource.FType = jdtObject) then begin
          if AChildSource.FObject.GetIsArray then
            NestCopy(AChildSource.FObject, AParentDest.NewChildArray(AChildSource.FName))
          else
            NestCopy(AChildSource.FObject, AParentDest.NewChildObject(AChildSource.FName))
        end else begin
          AChildDest := JSONObject(AParentDest).add(AChildSource.FName);
          AChildDest.CopyValue(AChildSource);
        end;
      end;
    end;
  end;

begin
  if Assigned(AFilter) then begin
    if GetIsArray then
      Result := NewJsonArray()
    else
      Result := NewJsonObject();
    NestCopy(Self, Result);
  end else
    Result := Copy;
end;

constructor JSONBase.Create;
begin
  FData := nil;
  FParent := nil;
  FValue := nil;
  {$IFDEF UNICODE}
  FItems := TList<PJSONValue>.Create;
  {$ELSE}
  FItems := JSONList.Create;
  {$ENDIF}
end;

procedure JSONBase.Decode(p: PJSONChar; len: Integer);
  procedure DecodeCopy;
  var
    S: JSONString;
  begin
    S := StrDup(p, 0, len);
    p := PJSONChar(S);
    DecodeObject(p);
  end;
begin
  Clear;
  if (len>0) and (p[len] <> #0) then
    DecodeCopy
  else
    DecodeObject(p);
end;

procedure JSONBase.Decode(const s: JSONString);
begin
  Decode(PJSONChar(S), Length(S));
end;

procedure JSONBase.DecodeObject(var p: PJSONChar);
var
  ABuilder: TStringCatHelper;
  ps: PJSONChar;
  ErrCode: Integer;
begin
  ABuilder := TStringCatHelper.Create(8192);
  ps := p;
  try
    try
      {$IFDEF JSON_UNICODE}SkipSpaceW(p);{$ELSE}SkipSpaceA(p);{$ENDIF}
      ErrCode := ParseJsonPair(ABuilder, p);
      if (p^ <> #0) and StrictJson then begin
        ErrCode := EParse_ExpectingEOF;
      end;
      if (ErrCode <> 0) then
        RaiseParseException(ErrCode, ps, p);
    finally
      ABuilder.Free;
    end;
  except on E:Exception do
    raise Exception.Create(FormatParseError(EParse_Unknown, E.Message, ps, p));
  end;
end;

{$IFDEF UNICODE}
procedure JSONBase.DeleteIf(const ATag: Pointer; ANest: Boolean; AFilter: JSONFilterEventA);
  procedure DeleteChildren(AParent: JSONBase);
  var
    I: Integer;
    Accept: Boolean;
    AChild: PJSONValue;
  begin
    I := AParent.Count - 1;
    while I >= 0 do begin
      Accept := True;
      AChild := AParent.Items[I];
      if ANest and (Assigned(AChild.FObject) and (AChild.FType = jdtObject)) then
        DeleteChildren(AChild.FObject);
      AFilter(Self, AChild, Accept, ATag);
      if Accept then
        AParent.Remove(I);
      Dec(I);
    end;
  end;

begin
  if Assigned(AFilter) then
    DeleteChildren(Self)
  else
    Clear;
end;
{$ENDIF}

procedure JSONBase.DeleteIf(const ATag: Pointer; ANest: Boolean; AFilter: JSONFilterEvent);
  procedure DeleteChildren(AParent: JSONBase);
  var
    I: Integer;
    Accept: Boolean;
    AChild: PJSONValue;
  begin
    I := AParent.Count - 1;
    while I >= 0 do begin
      Accept := True;
      AChild := AParent.Items[I];
      if ANest and (Assigned(AChild.FObject) and (AChild.FType = jdtObject)) then
        DeleteChildren(AChild.FObject);
      AFilter(Self, AChild, Accept, ATag);
      if Accept then
        AParent.Remove(I);
      Dec(I);
    end;
  end;

begin
  if Assigned(AFilter) then
    DeleteChildren(Self)
  else
    Clear;
end;

destructor JSONBase.Destroy;
begin
  Clear;
  FItems.Free;
  if (FParent = nil) and (FValue <> nil) and (FValue.FType = jdtUnknown) then
    FreeJsonValue(FValue); // JSONΪ�������ʱ��FValue��Ϊnilʱ�ͷ�FValue
  inherited;
end;

class function JSONBase.Encode(Obj: JSONBase; AIndent: Integer; ADoEscape: Boolean): JSONString;
var
  ABuilder: TStringCatHelper;
begin
  if Obj = nil then Exit;
  ABuilder := TStringCatHelper.Create;
  try
    InternalEncode(Obj, ABuilder, AIndent, ADoEscape);
    ABuilder.Back(1); //ɾ�����һ������
    Result := ABuilder.Value;
  finally
    ABuilder.Free;
  end;
end;

function JSONBase.Encode(AIndent: Integer; ADoEscape: Boolean): JSONString;
begin
  Encode(Self, AIndent, ADoEscape);
end;

function JSONBase.Exist(const Key: JSONString): Boolean;
begin
  Result := IndexOf(Key) > -1;
end;

function JSONBase.FormatParseError(ACode: Integer; AMsg: JSONString; ps,
  p: PJSONChar): JSONString;
var
  ACol, ARow: Integer;
  ALine: JSONString;
begin
  if ACode<>0 then begin
    p := {$IFDEF JSON_UNICODE}StrPosW{$ELSE}StrPosA{$ENDIF}(ps, p, ACol, ARow);
    ALine := {$IFDEF JSON_UNICODE}DecodeLineW{$ELSE}DecodeLineA{$ENDIF}(p, False);
    if Length(ALine) > 200 then
      ALine := StrDup(PJSONChar(ALine), 0, 200) + '...';
    Result:=Format(SJsonParseError,[ARow, ACol, AMsg, ALine]);
  end else
    Result := '';
end;

function JSONBase.GetCount: Integer;
begin
  Result := FItems.Count;
end;

function JSONBase.GetEnumerator: JSONEnumerator;
begin
  Result := JSONEnumerator.Create(Self);
end;

function JSONBase.GetIsArray: Boolean;
begin
  Result := False;
end;

function JSONBase.GetIsJSONArray: Boolean;
begin
  Result := GetIsArray;
end;

function JSONBase.GetIsJSONObject: Boolean;
begin
  Result := not GetIsArray;
end;

function JSONBase.GetItemIndex: Integer;
var
  I: Integer;
begin
  Result := -1;
  if Assigned(Parent) then begin
    for I := 0 to Parent.GetCount - 1 do begin
      if Parent[i].FObject = Self then begin
        Result := I;
        Break;
      end;
    end;
  end;
end;

function JSONBase.GetItems(Index: Integer): PJSONValue;
begin
  Result := FItems.Items[index];
end;

function JSONBase.GetName: JSONString;
begin
  if FValue = nil then
    Result := ''
  else
    Result := FValue.FName;
end;

function JSONBase.GetValue: JSONString;
begin
  Result := Encode(Self);
end;

function JSONBase.IndexOf(const Key: JSONString): Integer;
var
  Item: PJSONValue;
  AHash: Cardinal;
  I, l: Integer;
begin
  Result := -1;
  l := Length(Key);
  if l > 0 then
    AHash := HashOf(PJSONChar(Key), l{$IFDEF JSON_UNICODE} shl 1{$ENDIF})
  else
    AHash := 0;
  for I := 0 to FItems.Count - 1 do begin
    Item := FItems.Items[i];
    if Length(Item.FName) = l then begin
      if JsonCaseSensitive then begin
        if Item.FNameHash = 0 then
          Item.FNameHash := HashOf(PJSONChar(Item.FName), l{$IFDEF JSON_UNICODE} shl 1{$ENDIF});
        if (Item.FNameHash = AHash) and (Item.FName = Key) then begin
          Result := I;
          Break;
        end;
      end else if StartWithIgnoreCase(PJSONChar(Item.FName), PJSONChar(Key)) then begin
        Result := I;
        Break;
      end;
    end;
  end;
end;

class function JSONBase.InternalEncode(Obj: JSONBase; ABuilder: TStringCatHelper;
  AIndent: Integer; ADoEscape: Boolean): TStringCatHelper;
var
  AIndentStr: JSONString;

  procedure DoEncode(ANode: JSONBase; ALevel: Integer);
  var
    I: Integer;
    Item: PJSONValue;
    IsArray: Boolean;
  begin
    if ANode.FItems.Count > 0 then begin
      IsArray := ANode.GetIsArray;
      if IsArray then begin
        ABuilder.Cat(CharArrayStart, 1);
      end else begin
        ABuilder.Cat(CharObjectStart, 1);
      end;

      for I := 0 to ANode.FItems.Count - 1 do begin
        Item := ANode.FItems[I];
        if Item = nil then Continue;
        if (AIndent > 0) then begin
          ABuilder.Cat(SLineBreak);
          ABuilder.Replicate(AIndentStr, ALevel + 1);
        end;
        if (item.FName <> '') or (not IsArray) then begin
          ABuilder.Cat(CharStringStart, 1);
          CatValue(ABuilder, item.FName, ADoEscape);
          ABuilder.Cat(CharNameEnd, 2 + Ord(JsonNameAfterSpace));
        end;
        case Item.FType of
          jdtObject:
            begin
              if Item.FObject <> nil then begin
                if not Item.FObject.GetIsArray then begin
                  if (not IsArray) and (Length(Item.FName) = 0) then
                    raise Exception.CreateFmt(SObjectChildNeedName, [Item.FName, I]); 
                end;
                DoEncode(Item.FObject, ALevel+1);
              end;
            end;
          jdtString:
            begin
              ABuilder.Cat(CharStringStart, 1);
              CatValue(ABuilder, Item.GetString, ADoEscape);
              ABuilder.Cat(CharStringEnd, 2);
            end;
          jdtInteger:
            begin
              ABuilder.Cat(IntToStr(Item.AsInt64));
              ABuilder.Cat(CharComma, 1);
            end;
          jdtFloat:
            begin
              if JsonFloatDigits <= 0 then
                ABuilder.Cat(FloatToStrEx(Item.AsFloat))
              else
                ABuilder.Cat(FloatToStr(Item.AsFloat));
              ABuilder.Cat(CharComma, 1);
            end;
          jdtBoolean:
            begin
              ABuilder.Cat(BoolToStr(Item.AsBoolean));
              ABuilder.Cat(CharComma, 1);
            end;
          jdtDateTime:
            begin
              ABuilder.Cat(CharStringStart, 1);
              if StrictJson or (JsonDateFormatStyle = jdsJsonTime) then
                StrictJsonTime(ABuilder, Item.AsDateTime)
              else
                ABuilder.Cat(Item.ToString);
              ABuilder.Cat(CharStringEnd, 1);
              ABuilder.Cat(CharComma, 1);
            end;
          jdtBytes:
            begin
              ABuilder.Cat(CharStringStart, 1);
              CatValue(ABuilder, Item.ToString(0), ADoEscape);
              ABuilder.Cat(CharStringEnd, 2);
            end;
          jdtNull, jdtUnknown:
            ABuilder.Cat(CharNull, 5);
        end;
      end;
      ABuilder.Back(1);
    end else if Assigned(ANode.FParent) then begin
      if ANode.GetIsArray then
        ABuilder.Cat(CharArrayEmpty, 2)
      else
        ABuilder.Cat(CharObjectEmpty, 2);
      ABuilder.Cat(CharComma, 1);
      Exit;
    end else begin
      ABuilder.Cat(CharObjectEmpty, 3);
      Exit;
    end;

    if AIndent > 0 then begin
      ABuilder.Cat(SLineBreak);
      ABuilder.Replicate(AIndentStr, ALevel);
    end;

    if IsArray then begin
      ABuilder.Cat(CharArrayEnd, 2);
    end else begin
      ABuilder.Cat(CharObjectEnd, 2);
    end;
  end;

  function SpaceStr(const L: Integer): JSONString;
  var
    P, PE: PJSONChar;
  begin
    SetLength(Result, L);
    P := PJSONChar(Result);
    PE := P + L;
    while P < PE do begin
      P^ := ' ';
      Inc(P);
    end;
  end;

begin
  Result := ABuilder;
  AIndentStr := SpaceStr(AIndent);
  DoEncode(Obj, 0);
end;

{$IFDEF JSON_RTTI}
function JSONBase.Invoke(AInstance: TValue): TValue;
var
  AMethods: TArray<TRttiMethod>;
  AParams: TArray<TRttiParameter>;
  AMethod: TRttiMethod;
  AType: TRttiType;
  AContext: TRttiContext;
  AParamValues: array of TValue;
  I, c: Integer;
  AParamItem: PJSONValue;
begin
  AContext := TRttiContext.Create;
  Result := TValue.Empty;
  if AInstance.IsObject then
    AType := AContext.GetType(AInstance.AsObject.ClassInfo)
  else if AInstance.IsClass then
    AType := AContext.GetType(AInstance.AsClass)
  else if AInstance.Kind = tkRecord then
    AType := AContext.GetType(AInstance.TypeInfo)
  else
    AType := AContext.GetType(AInstance.TypeInfo);
  AMethods := AType.GetMethods(GetName);
  c := Count;
  for AMethod in AMethods do begin
    AParams := AMethod.GetParameters;
    if Length(AParams) = c then begin
      SetLength(AParamValues, c);
      for I := 0 to c - 1 do begin
        AParamItem := JSONObject(Self).getItem(AParams[I].Name);
        if AParamItem <> nil then
          AParamValues[I] := AParamItem.ToObjectValue
        else
          raise Exception.CreateFmt(SParamMissed, [AParams[I].Name]);
      end;
      Result := AMethod.Invoke(AInstance, AParamValues);
      Exit;
      end;
    end;
  raise Exception.CreateFmt(SMethodMissed,[Name]);
end;
{$ENDIF}

function JSONBase.ItemByPath(const APath: JSONString; const ADelimiter: JSONChar): PJSONValue;
var
  AParent: JSONBase;
  AName: JSONString;
  p, pn, ws: PJSONChar;
  AIndex: Int64;
  I, L: Integer;
begin
  AParent := Self;
  p := PJSONChar(APath);
  Result := nil;
  while Assigned(AParent) and (p^ <> #0) do begin
    AName := DecodeToken(p, ADelimiter, JSONChar(0), False);
    if Length(AName) > 0 then begin       
      l := Length(AName);
      AIndex := -1;
      pn := PJSONChar(AName);
      if (pn[l - 1] = ']') then begin // ���ҵ������飿
        repeat
          if pn[l] = '[' then begin
            ws := pn + l + 1;
            ParseInt(ws, AIndex);
            Break;
          end else
            Dec(l);
        until l = 0;
        if l > 0 then begin
          AName := StrDupX(pn, l);
          I := AParent.IndexOf(AName);
          if (I > -1) then begin
            Result := AParent.FItems.items[I]; 
            if (Assigned(Result.AsJsonArray)) and (AIndex >= 0) and (AIndex < Result.FObject.Count) then begin
              Result := Result.FObject.FItems[AIndex];
              AParent := Result.FObject;
            end else 
              Break;
          end else 
            Break;
        end else 
          Break;
      end else begin
        I := AParent.IndexOf(AName);
        if (I > -1) then begin
          Result := AParent.FItems.Items[I]; 
          AParent := Result.FObject;
        end else begin
          Result := nil;
          Break;
        end;
      end;      
      if p^ = ADelimiter then
        Inc(p);
    end;
  end;
  if p^ <> #0 then
    Result := nil;
end;

{$IFDEF USERegEx}
function JSONBase.ItemByRegex(const ARegex: JSONString; AList: JSONList;
  ANest: Boolean): Integer;
var
  ANode: PJSONValue;
  APcre: TPerlRegEx;
  
  function InternalFind(AParent: JSONBase): Integer;
  var
    I: Integer;
  begin
    Result := 0;
    for I := 0 to AParent.Count - 1 do begin
      ANode := AParent.Items[I];
      APcre.Subject := ANode.FName;
      if APcre.Match then begin
        AList.Add(ANode);
        Inc(Result);
      end;
      if ANest and (Assigned(ANode.FObject) and (ANode.FType = jdtObject)) then
        Inc(Result, InternalFind(ANode.FObject));
    end;
  end;
begin
  APcre := TPerlRegEx.Create;
  try
    APcre.RegEx := ARegex;
    APcre.Compile;
    Result := InternalFind(Self);
  finally
    APcre.Free;
  end;  
end;
{$ENDIF}

procedure JSONBase.LoadFromFile(const AFileName: JSONString; AEncoding: TTextEncoding);
var
  AStream: TFileStream;
begin
  if not FileExists(AFileName) then Exit;
  AStream := TFileStream.Create(AFileName, fmOpenRead or fmShareDenyWrite);
  try
    LoadFromStream(AStream, AEncoding);
  finally
    AStream.Free;
  end;
end;

procedure JSONBase.LoadFromStream(AStream: TStream; AEncoding: TTextEncoding);
var
  S: JSONString;
begin
  S := {$IFDEF JSON_UNICODE}LoadTextW{$ELSE}LoadTextA{$ENDIF}(AStream, AEncoding);
  if Length(S) > 1 then
    Decode(PJSONChar(S), Length(S))
  else
    raise Exception.Create(SBadJson);
end;

function JSONBase.NewChildArray(const key: JSONString): JSONArray;
var
  Item: PJSONValue;
begin
  Result := NewJsonArray();
  Result.FParent := Self;
  Item := NewJsonValue();
  Item.FName := key;
  Item.FNameHash := 0;
  Item.FObject := Result;
  Item.FType := jdtObject;
  FItems.Add(Item);
  Result.FValue := Item;
end;

function JSONBase.NewChildObject(const key: JSONString): JSONObject;
var
  Item: PJSONValue;
begin
  Result := NewJsonObject();
  Result.FParent := Self;
  Item := NewJsonValue();
  Item.FName := key;
  Item.FNameHash := 0;
  Item.FObject := Result;
  Item.FType := jdtObject;
  FItems.Add(Item);
  Result.FValue := Item;
end;

function JSONBase.Next: PJSONValue;
var
  I: Integer;
begin
  Result := nil;
  if Assigned(Parent) then begin
    for I := 0 to Parent.GetCount - 1 do begin
      if Parent.GetItems(i).FObject = Self then begin
        if I + 1 < Parent.GetCount then
          Result := Parent.GetItems(i + 1);
        Break;
      end;
    end;
  end;
end;

function JSONBase.ParseValue(ABuilder: TStringCatHelper;
  var p: PJSONChar; const FName: JSONString): Integer;
const
  JsonEndChars: PJSONChar = ',}]';
  MaxInt64: Int64 = High(Int64); //9223372036854775807;
  MinInt64: Int64 = Low(Int64); // -9223372036854775808;
var
  ANum: Extended;
begin
  Result := 0;
  if p^ = '"' then begin
    BuildJsonString(ABuilder, p);
    JSONObject(Self).put(FName, ABuilder);
  end else if p^='''' then begin
    if StrictJson then begin
      Result := EParse_BadStringStart;
      Exit;
    end;
    BuildJsonString(ABuilder, p);
    JSONObject(Self).put(FName, ABuilder);
  end else if ParseNumeric(p, ANum) then begin //���֣�
    {$IFDEF JSON_UNICODE}SkipSpaceW{$ELSE}SkipSpaceA{$ENDIF}(p);
    if (p^ = #0) or {$IFDEF JSON_UNICODE}CharInW{$ELSE}CharInA{$ENDIF}(p, JsonEndChars) then begin
      if (ANum >= MinInt64) and (ANum <= MaxInt64) and SameValue(ANum, Trunc(ANum), 5E-324) then
        JSONObject(Self).Add(FName).AsInt64 := Trunc(ANum)
      else
        JSONObject(Self).Add(FName).AsFloat := ANum;
    end else begin
      Result := EParse_BadJson;
      Exit;
    end;
  end else if StartWith(p, 'False', True) then begin //False
    Inc(p,5);
    {$IFDEF JSON_UNICODE}SkipSpaceW{$ELSE}SkipSpaceA{$ENDIF}(p);
    JSONObject(Self).Add(FName).AsBoolean := False;
  end else if StartWith(p, 'True', True) then begin //True
    Inc(p,4);
    {$IFDEF JSON_UNICODE}SkipSpaceW{$ELSE}SkipSpaceA{$ENDIF}(p);
    JSONObject(Self).Add(FName).AsBoolean := True;
  end else if StartWith(p, 'NULL', True) then begin //Null
    Inc(p,4);
    {$IFDEF JSON_UNICODE}SkipSpaceW{$ELSE}SkipSpaceA{$ENDIF}(p);
    JSONObject(Self).put(FName, NULL);  // ���ѡ��й����족���� 2014.08.01
  end else if p^ = '{' then begin
    Result := NewChildObject(FName).ParseJsonPair(ABuilder, p);
  end else if p^ = '[' then begin
    Result := NewChildArray(FName).ParseJsonPair(ABuilder, p);
  end else
    Result := EParse_BadJson;
end;

function JSONBase.ParseJsonPair(ABuilder: TStringCatHelper; var p: PJSONChar): Integer;

  procedure SkipComment;
  begin
    while p^ = '/' do begin
      if StrictJson then begin
        Result := EParse_CommentNotSupport;
        Exit;
      end;
      if p[1] = '/' then begin
        {$IFDEF JSON_UNICODE}SkipUntilW{$ELSE}SkipUntilA{$ENDIF}(p, #10);
        {$IFDEF JSON_UNICODE}SkipSpaceW{$ELSE}SkipSpaceA{$ENDIF}(p);
      end else if p[1] = '*' then begin
        Inc(p, 2);
        while p^ <> #0 do begin
          if (p[0] = '*') and (p[1] = '/') then begin
            Inc(p, 2);
            {$IFDEF JSON_UNICODE}SkipSpaceW{$ELSE}SkipSpaceA{$ENDIF}(p);
            Break;
          end else
            Inc(p);
        end;
      end else begin
        Result := EParse_UnknownToken;
        Exit;
      end;
    end;
  end;

begin
  SkipComment;
  if p^ = '{' then begin
    Inc(p);
    {$IFDEF JSON_UNICODE}SkipSpaceW{$ELSE}SkipSpaceA{$ENDIF}(p);
    while (p^<>#0) and (p^ <> '}') do begin
      SkipComment;
      //��������
      if StrictJson and (p^ <> '"') then begin
        Result := EParse_BadNameStart;
        Exit;
      end;
      BuildJsonString(ABuilder, p);
      if p^ <> ':' then begin
        Result := EParse_BadNameEnd;
        Exit;
      end;
      //if ABuilder.Position = 0 then begin
      //  Result := EParse_NameNotFound;
      //  Exit;
      //end;  // ��������Ϊ�� by 2018.01.25
      Inc(p);
      {$IFDEF JSON_UNICODE}SkipSpaceW{$ELSE}SkipSpaceA{$ENDIF}(p);
      //����ֵ
      Result := ParseValue(ABuilder, p, ABuilder.Value);
      if Result <> 0 then Exit;
      if p^ = ',' then begin
        Inc(p);
        {$IFDEF JSON_UNICODE}SkipSpaceW{$ELSE}SkipSpaceA{$ENDIF}(p);
      end;
    end;

    if p^ <> '}' then begin
      Result := EParse_BadJson;
      Exit;
    end

  end else if p^ = '[' then begin
    if (Assigned(FParent)) and (not FParent.GetIsArray) then begin
      if Length(GetName) = 0 then begin
        Result := NewChildArray('unknown').ParseJsonPair(ABuilder, p);
        Exit;
      end;
    end;

    Inc(p);
    {$IFDEF JSON_UNICODE}SkipSpaceW{$ELSE}SkipSpaceA{$ENDIF}(p);
    while (p^<>#0) and (p^<>']') do begin
      Result := ParseValue(ABuilder, p, '');
      if Result <> 0 then Exit;
      if p^ = ',' then begin
        Inc(p);
        {$IFDEF JSON_UNICODE}SkipSpaceW{$ELSE}SkipSpaceA{$ENDIF}(p);
      end;
    end;

    if p^ <> ']' then begin
      Result := EParse_BadJson;
      Exit;
    end

  end else begin
    Result := EParse_EndCharNeeded;
    Exit;
  end;

  Inc(p);
  {$IFDEF JSON_UNICODE}SkipSpaceW{$ELSE}SkipSpaceA{$ENDIF}(p);
  Result := 0;
end;

function JSONBase.parse(const text: JSONString; IgnoreZero: Boolean): Boolean;
var
  I: Integer;
  S: JSONString;
  P, P1, PMax: PJSONChar;
begin
  if Length(text) < 2 then
    Result := False
  else begin
    P := PJSONChar(text);
    if IgnoreZero then begin
      P1 := P;
      PMax := P + Length(text);
      while (P1 < PMax) and (P1^ <> #0) do Inc(P1);
      if PMax - P1 > 0 then begin // �ַ����д��� #0 ʱ�Ŵ���һ���������д���
        S := text;
        for I := P1 - P + 1 to Length(S) do begin
          if S[I] = #0 then
            S[I] := #32;
        end;
        P := PJSONChar(S);
      end;
    end;
    Decode(P, Length(text));
    Result := True;
  end;
end;

function JSONBase.parse(p: PJSONChar; len: Integer): Boolean;
begin
  Decode(p, len);
  Result := True;
end;

class function JSONBase.parseArray(const text: JSONString; RaiseError: Boolean): JSONArray;
begin
  Result := NewJsonArray();
  try
    JSONArray(Result).parse(text);
  except
    FreeJsonArray(JSONBase(Result));
    if RaiseError then raise;
  end;
end;

class function JSONBase.parseObject(const text: JSONString; RaiseError: Boolean): JSONObject;
begin
  Result := NewJsonObject();
  try
    JSONObject(Result).parse(text);
  except
    FreeJsonObject(JSONBase(Result));
    if RaiseError then raise;
  end;
end;  

class function JSONBase.Parser(P: PJSONChar; Len: Integer;
  RaiseError: Boolean): JSONBase;
var
  P1, PMax: PJSONChar;
begin
  P1 := P;
  if Len >= 0 then
    PMax := P + Len
  else
    PMax := nil;
  {$IFDEF JSON_UNICODE}SkipSpaceW(P);{$ELSE}SkipSpaceA(P);{$ENDIF}
  if (PMax <> nil) and (P > PMax) then begin
    Result := nil;
    if RaiseError then
      raise Exception.Create(SBadJson);
    Exit;
  end;
  if P^ = '[' then
    Result := NewJsonArray()
  else
    Result := NewJsonObject();
  try
    Result.Parse(P1, Len);
  except
    FreeAndNil(Result);
    if RaiseError then raise;
  end;
end;

class procedure JSONBase.CatJson(ABuilder: TStringCatHelper;
  const AValue: JSONString; ADoEscape: Boolean);
begin
  CatValue(ABuilder, AValue, ADoEscape);
end;

class function JSONBase.Parser(const Text: JSONString;
  RaiseError: Boolean): JSONBase;
var
  P: PJSONChar;
begin
  P := PJSONChar(Text);
  {$IFDEF JSON_UNICODE}SkipSpaceW(P);{$ELSE}SkipSpaceA(P);{$ENDIF}
  if P^ = '[' then
    Result := NewJsonArray()
  else
    Result := NewJsonObject();
  try
    Result.Parse(P);
  except
    FreeAndNil(Result);
    if RaiseError then raise;
  end;
end;

class function JSONBase.Parser(const AStream: TStream; RaiseError: Boolean = True): JSONBase;
var
  Data: JSONString;
begin
  Data := {$IFDEF JSON_UNICODE}LoadTextW{$ELSE}LoadTextA{$ENDIF}(AStream, teUnknown);
  Result := Parser(Data, RaiseError);
end;

function JSONBase.FindIf(const ATag: Pointer; ANest: Boolean;
  AFilter: JSONFilterEvent): PJSONValue;
  
  function DoFind(AParent: JSONBase): PJSONValue;
  var
    I: Integer;
    AChild: PJSONValue;
    Accept: Boolean;
  begin
    Result := nil;
    for I := 0 to AParent.Count - 1 do begin
      AChild := AParent[I];
      Accept := True;
      AFilter(Self, AChild, Accept, ATag);
      if Accept then
        Result := AChild
      else if ANest and (Assigned(AChild.FObject)) then
        Result := DoFind(AChild.FObject);
      if Result <> nil then
        Break;
    end;
  end;

begin
  if Assigned(AFilter) then
    Result := DoFind(Self)
  else
    Result := nil;    
end;

{$IFDEF UNICODE} 
function JSONBase.FindIf(const ATag: Pointer; ANest: Boolean; AFilter: JSONFilterEventA): PJSONValue;

  function DoFind(AParent: JSONBase): PJSONValue;
  var
    I: Integer;
    AChild: PJSONValue;
    Accept: Boolean;
  begin
    Result := nil;
    for I := 0 to AParent.Count - 1 do begin
      AChild := AParent[I];
      Accept := True;
      AFilter(Self, AChild, Accept, ATag);
      if Accept then
        Result := AChild
      else if ANest and (Assigned(AChild.FObject)) then
        Result := DoFind(AChild.FObject);
      if Result <> nil then
        Break;
    end;
  end;

begin
  if Assigned(AFilter) then
    Result := DoFind(Self)
  else
    Result := nil;
end;
{$ENDIF}

function JSONBase.ForcePath(const APath: JSONString; const ADelimiter: JSONChar): PJSONValue;
var
  AName: JSONString;
  p, pn, ws: PJSONChar;
  AParent: JSONBase;
  I, L: Integer;
  AIndex: Int64;
begin
  p := PJSONChar(APath);
  AParent := Self;
  Result := nil;
  while p^ <> #0 do begin
    if (Result <> nil) and (Result.FObject = nil) then begin
      Result.AsJsonObject := NewJsonObject();
      Result.FObject.FParent := AParent;
      AParent := Result.FObject;
      AParent.FValue := Result;
    end;
    AName := DecodeToken(p, ADelimiter, JSONChar(0), True);
    I := AParent.IndexOf(AName);
    if I < 0 then begin
      pn := PJSONChar(AName);
      l := Length(AName);
      AIndex := -1;
      if (pn[l - 1] = ']') then begin
        repeat
          if pn[l] = '[' then begin
            ws := pn + l + 1;
            if ParseInt(ws, AIndex) = 0 then
              AIndex := -1;
            Break;
          end else
            Dec(l);
        until l = 0;
        if l > 0 then begin
          AName := StrDupX(pn, l);
          I := AParent.IndexOf(AName);
          if I < 0 then 
            AParent := AParent.NewChildArray(AName)              
          else begin
            AParent := AParent{$IFDEF JSON_UNICODE}.FItems{$ENDIF}[I].AsJsonArray;
            if not Assigned(AParent) then
              raise Exception.CreateFmt(SBadJsonArray, [AName]);
          end;
          if AIndex >= 0 then begin
            while AParent.Count <= AIndex do
              JSONArray(AParent).Add(NULL);
            Result := AParent[AIndex];             
            if Assigned(Result.FObject) then
              AParent := Result.FObject;
          end else 
            Result := AParent.FValue;
        end else
          raise Exception.CreateFmt(SBadJsonName, [AName]);
      end else begin
        if (AParent.GetIsArray) then          
          AParent := AParent.NewChildObject('');
        Result := JSONObject(AParent).Add(AName);
      end;
    end else begin
      Result := JSONObject(AParent).Items[I];
      AParent := Result.FObject;
      if (p^ <> #0) and (not Assigned(AParent)) then 
        raise Exception.CreateFmt(SBadJsonName, [AName]);
    end;
  end;
end;

{$IFDEF USEDBRTTI}
procedure JSONBase.PutDataSet(const Key: JSONString; aIn: TDataSet);
begin
  TYxdSerialize.WriteDataSet(Self, key, aIn, 0, 0, True);
end;
{$ENDIF}

{$IFDEF USEDBRTTI}
procedure JSONBase.PutDataSet(const Key: JSONString; aIn: TDataSet;
  const PageIndex, PageSize: Integer; Base64Blob: Boolean);
begin
  TYxdSerialize.WriteDataSet(Self, key, aIn, PageIndex, PageSize, Base64Blob);
end;
{$ENDIF}

procedure JSONBase.putJSON(const key, value: JSONString; AType: JsonDataType);
var
  p: PJSONChar;
  Item: PJSONValue;

  procedure AddAsDateTime;
  var
    ATime: TDateTime;
  begin
    if ParseDateTime(p, ATime) then
      Item.AsDateTime := ATime
    else if ParseJsonTime(p, ATime) then
      Item.AsDateTime := ATime
    else
      raise Exception.Create(SBadJsonTime);
  end;

  procedure AddUnknown();
  var
    I: Integer;
    ABuilder: TStringCatHelper;
  begin
    ABuilder := TStringCatHelper.Create;
    try
      if (p^ = '{') then
        i := NewChildObject(key).ParseJsonPair(ABuilder, p)
      else if (p^ = '[') then begin
        i := NewChildArray(key).ParseJsonPair(ABuilder, p)
      end else
        i := ParseValue(ABuilder, p, key);
      if i <> 0 then
        JSONObject(Self).put(key, value);
    finally
      ABuilder.Free;
    end;
  end;

begin
  p := PJSONChar(value);
  if AType = jdtUnknown then begin
    AddUnknown();
  end else begin
    Item := NewJsonValue();
    Item.FObject := nil;
    Item.FNameHash := 0;
    Item.FName := key;
    FItems.Add(Item);
    case AType of
      jdtString:
        Item.AsString := value;
      jdtInteger:
        Item.AsInteger := StrToInt(value);
      jdtFloat:
        item.AsFloat := StrToFloat(value);
      jdtBoolean:
        item.AsBoolean := StrToBool(value);
      jdtDateTime:
        AddAsDateTime;
      jdtObject:
        begin
          if (p^ = '{') then
            Item.AsJsonObject := JSONObject.parseObject(value)
          else if (p^ = '[') then
            Item.AsJsonArray := JSONArray.parseArray(value)
          else
            raise Exception.CreateFmt(SBadJsonObject, [Value]);
          if Assigned(Item.FObject) then begin
            Item.FObject.FValue := Item;
            Item.FObject.FParent := Self;
          end;
        end;
    end;
  end;
end;

procedure JSONBase.RaiseParseException(ACode: Integer; ps, p: PJSONChar);
begin
  if ACode<>0 then begin
    case ACode of
      EParse_BadStringStart:
        raise Exception.Create(FormatParseError(ACode,SBadStringStart,ps,p));
      EParse_BadJson:
        raise Exception.Create(FormatParseError(ACode,SBadJson, ps,p));
      EParse_CommentNotSupport:
        raise Exception.Create(FormatParseError(ACode,SCommentNotSupport, ps,p));
      EParse_UnknownToken:
        raise Exception.Create(FormatParseError(ACode,SUnknownToken, ps,p));
      EParse_EndCharNeeded:
        raise Exception.Create(FormatParseError(ACode,SEndCharNeeded, ps,p));
      EParse_BadNameStart:
        raise Exception.Create(FormatParseError(ACode,SBadNameStart, ps,p));
      EParse_BadNameEnd:
        raise Exception.Create(FormatParseError(ACode,SBadNameEnd, ps,p));
      EParse_NameNotFound:
        raise Exception.Create(FormatParseError(ACode,SNameNotFound, ps,p));
      EParse_ExpectingEOF:
        raise Exception.Create(FormatParseError(ACode, SExpectingEOF, ps, p))
      else
        raise Exception.Create(FormatParseError(ACode,SUnknownError, ps,p));
    end;
  end;
end;

{$IFDEF USEDBRTTI}
function JSONBase.ToDataSet(aOut: TDataSet): Integer;
begin
  Result := TYxdSerialize.ReadDataSet(Self, aOut);
end;
{$ENDIF}
{$IFDEF USERTTI}
procedure JSONBase.ToObject(aDest: TObject);
begin
  TYxdSerialize.readObject(Self, aDest);
end;
{$ENDIF}
{$IFDEF JSON_RTTI}
procedure JSONBase.ToRecord<T>(out aInstance: T);
begin
  TYxdSerialize.readRecord<T>(Self, aInstance);
end;
{$ENDIF}
{$IFDEF USERTTI}
procedure JSONBase.ToObjectValue(aDest: Pointer; aType: PTypeInfo);
begin
  TYxdSerialize.readValue(Self, aDest, aType);
end;
{$ENDIF}
{$IFDEF JSON_RTTI}
procedure JSONBase.ToObjectValue(aInstance: TValue);
begin
  TYxdSerialize.readValue(Self, aInstance);
end;
{$ENDIF}

procedure JSONBase.Remove(Index: Integer);
var
  item: PJSONValue;
begin
  if (Index > -1) and (Index < FItems.Count) then begin
    item := FItems.Items[index];
    if item <> nil then begin
      item.Free;
      FreeJsonValue(Item);
      FItems.Delete(Index);
    end;
  end;
end;

procedure JSONBase.RemoveObject(obj: JSONBase);
var
  I: Integer;
  item: PJSONValue;
begin
  for I := 0 to FItems.Count - 1 do begin
    item := FItems.Items[i];
    if (item <> nil) and (item.FObject = obj) then begin
      obj.FParent := nil;
      obj.FValue := nil;
      FItems.Delete(i);
      FreeJsonValue(Item);
    end;
  end;
end;

procedure JSONBase.SaveToFile(const AFileName: JSONString; AIndent: Integer);
begin
  SaveToFile(AFileName, AIndent, {$IFDEF JSON_UNICODE}teUTF8{$ELSE}teAnsi{$ENDIF});
end;

procedure JSONBase.SaveToFile(const AFileName: JSONString; AIndent: Integer; AEncoding: TTextEncoding;
  AWriteBOM: Boolean);
var
  AStream: TMemoryStream;
begin
  AStream := TMemoryStream.Create;
  try
    SaveToStream(AStream, AIndent, AEncoding, AWriteBOM);
    AStream.SaveToFile(AFileName);
  finally
    AStream.Free;
  end;
end;

procedure JSONBase.SaveToStream(AStream: TStream; AIndent: Integer; AEncoding: TTextEncoding;
  AWriteBOM, ADoEscape: Boolean);
begin
  if AEncoding = teUTF8 then
    SaveTextU(AStream, {$IFDEF USEYxdStr}YxdStr.{$ELSE}YxdJson.{$ENDIF}Utf8Encode(toString(AIndent, ADoEscape)), AWriteBom, True)
  else if AEncoding = teAnsi then
    SaveTextA(AStream, AnsiString(toString(AIndent, ADoEscape)))
  else if AEncoding = teUnicode16LE then
    SaveTextW(AStream, toString(AIndent, ADoEscape), AWriteBom)
  else
    SaveTextWBE(AStream, toString(AIndent, ADoEscape), AWriteBom);
end;

procedure JSONBase.SaveToStream(AStream: TStream; AIndent: Integer; ADoEscape: Boolean);
begin
  SaveToStream(AStream, AIndent, {$IFDEF JSON_UNICODE}teUTF8{$ELSE}teAnsi{$ENDIF}, False, ADoEscape);
end;

{$IFDEF USERTTI}
class function JSONBase.Serialize(ASource: TObject): JSONString;
var
  Writer: TSerializeWriter; 
begin
  Writer := TJsonSerializeWriter.Create();
  try
    TYxdSerialize.Serialize(Writer, '', ASource);
    Result := Writer.ToString;
  finally
    FreeAndNil(Writer);
  end;
end;

class function JSONBase.Serialize(ASource: Pointer; AType: PTypeInfo): JSONString;
var
  Writer: TSerializeWriter; 
begin
  Writer := TJsonSerializeWriter.Create();
  try
    TYxdSerialize.Serialize(Writer, '', ASource, AType);
    Result := Writer.ToString;
  finally
    FreeAndNil(Writer);
  end;
end;

class function JSONBase.GetSerializeWriter(): TObject;
begin
  Result := TJsonSerializeWriter.Create();
end;
{$ENDIF}

{$IFDEF USEDBRTTI}
class function JSONBase.Serialize(ADataSet: TDataSet;
  const PageIndex, PageSize: Integer; Base64Blob: Boolean): JSONString;
var
  Writer: TSerializeWriter; 
begin
  Writer := TJsonSerializeWriter.Create();
  try
    TYxdSerialize.Serialize(Writer, '', ADataSet, PageIndex, PageSize, Base64Blob);
    Result := Writer.ToString;
  finally
    FreeAndNil(Writer);
  end;
end;
{$ENDIF}

{$IFDEF JSON_RTTI}
class function JSONBase.Serialize(AInstance: TValue): JSONString;
var
  Writer: TSerializeWriter;
begin
  Writer := TJsonSerializeWriter.Create();
  try
    TYxdSerialize.Serialize(Writer, '', AInstance);
    Result := Writer.ToString;
  finally
    FreeAndNil(Writer);
  end;
end;

class function JSONBase.Serialize<T>(AInstance: T): JSONString;
begin
  Result := Serialize(@AInstance, TypeInfo(T));
end;
{$ENDIF}

class procedure JSONBase.SetJsonCaseSensitive(v: Boolean);
begin
  JsonCaseSensitive := v;
end;

procedure JSONBase.SetName(const Value: JSONString);
begin
  if FValue = nil then begin
    FValue := NewJsonValue();
    FValue.FObject := nil;
    FValue.FNameHash := 0;
    FValue.FType := jdtUnknown;
  end;
  FValue.FName := Value;
end;

procedure JSONBase.SetValue(const Value: JSONString);
begin
  Decode(Value);
end;

{$IFDEF JSON_UNICODE}
function JSONBase.toString: JSONString;
begin
  Result := Encode(Self, 0);
end;
{$ENDIF}

function JSONBase.toString(AIndent: Integer; ADoEscape: Boolean): JSONString;
begin
  Result := Encode(Self, AIndent, ADoEscape);
end;

function JSONBase.TryParse(p: PJSONChar; len: Integer): Boolean;
  procedure DoTry();
  var
    ABuilder: TStringCatHelper;
  begin
    ABuilder := TStringCatHelper.Create;
    try
      try
        {$IFDEF JSON_UNICODE}SkipSpaceW(p);{$ELSE}SkipSpaceA(p);{$ENDIF}
        Result := ParseJsonPair(ABuilder, p) = 0;
      finally
        ABuilder.Free;
      end;
    except on E:Exception do
      Result := False;
    end;
  end;

  procedure DecodeCopy;
  var
    S: JSONString;
  begin
    S := StrDup(p, 0, len);
    p := PJSONChar(S);
    DoTry;
  end;
begin
  Clear;
  if (len>0) and (p[len] <> #0) then
    DecodeCopy
  else
    DoTry();
end;

function JSONBase.TryParse(const text: JSONString): Boolean;
begin
  Result := TryParse(PJSONChar(text), Length(text));
end;

{$IFDEF USERTTI}
procedure JSONBase.putObject(const key: JSONString; aSource: TObject);
begin
  TYxdSerialize.writeValue(Self, key, aSource{$IFNDEF JSON_UNICODE}, TYxdSerialize.GetObjectTypeInfo(aSource){$ENDIF});
end;
{$ENDIF}

{$IFDEF JSON_RTTI}
{$ENDIF}

{$IFDEF JSON_RTTI}
procedure JSONBase.putRecord<T>(const key: JSONString; const aSource: T);
begin
  TYxdSerialize.writeValue(Self, key, @aSource, TypeInfo(T));
end;
{$ENDIF}

{$IFDEF JSON_RTTI}
{$ENDIF}

{$IFDEF JSON_RTTI}
function JSONBase.ToObjectValue: TValue;
begin
  Result := TYxdSerialize.writeToValue(Self);
end;
{$ENDIF}

function JSONBase.GetPathPro: JSONString;
begin
  Result := GetPath('\');
end;

function JSONBase.GetPath(const ADelimiter: JSONChar): JSONString;
var
  AParent: JSONBase;
begin
  Result := '';
  AParent := Self;
  while Assigned(AParent) do begin
    if AParent.FParent <> nil then begin
      if AParent <> Self then begin
        if AParent.FParent.GetIsArray then
          Result := '[' + IntToStr(AParent.ItemIndex) + ']' + ADelimiter + Result
        else 
          Result := AParent.FValue.FName + ADelimiter + Result
      end else begin
        if AParent.FParent.GetIsArray then
          Result := '[' + IntToStr(AParent.ItemIndex) + ']'
        else 
          Result := AParent.FValue.FName;
      end;
    end else
      Break;
    AParent := AParent.FParent;
  end;   
end;

{$IFDEF USERTTI}
procedure JSONBase.putObjectValue(const key: JSONString; aSource: Pointer;
  aType: PTypeInfo);
begin
  TYxdSerialize.writeValue(Self, key, aSource, aType);
end;
{$ENDIF}
{$IFDEF JSON_RTTI}
procedure JSONBase.putObjectValue(const key: JSONString; aInstance: TValue);
begin
  TYxdSerialize.writeValue(Self, key, aInstance);
end;
{$ENDIF}

{ TStringCatHelper }
{$IFNDEF USEYxdStr}
function TStringCatHelper.Back(ALen: Integer): TStringCatHelper;
begin
  Result := Self;
  Dec(FDest, ALen);
  if FDest < PJSONChar(FValue) then
    FDest := PJSONChar(FValue);
end;

function TStringCatHelper.BackIf(const s: PJSONChar): TStringCatHelper;
var
  ps:PJSONChar;
begin
  Result := Self;
  ps := PJSONChar(FValue);
  while FDest > ps do begin
    {$IFDEF JSON_UNICODE}
    if (FDest[-1] >= #$DC00) and (FDest[-1] <= #$DFFF) then begin
      if CharIn(FDest-2, s) then
        Dec(FDest, 2)
      else
        Break;
    end else if CharIn(FDest-1,s) then
      Dec(FDest)
    else
      Break;
    {$ELSE}
    if CharIn(FDest-1, s) then
      Dec(FDest)
    else
      Break;
    {$ENDIF}
  end;
end;

function TStringCatHelper.Cat(const s: JSONString): TStringCatHelper;
begin
  Result := Cat(PJSONChar(s), Length(s));
end;

function TStringCatHelper.Cat(c: JSONChar): TStringCatHelper;
begin
  if (FDest-FStart)=FSize then
    NeedSize(-1);
  FDest^ := c;
  Inc(FDest);
  Result := Self;
end;

function TStringCatHelper.Cat(p: PJSONChar;
  len: Integer): TStringCatHelper;
begin
  Result := Self;
  if len < 0 then begin
    while p^ <> #0 do begin
      if FDest-FStart >= FSize then
        NeedSize(FSize + FBlockSize);
      FDest^ := p^;
      Inc(p);
      Inc(FDest);
    end;
  end else begin
    NeedSize(-len);
    Move(p^, FDest^, len{$IFDEF JSON_UNICODE} shl 1{$ENDIF});
    Inc(FDest, len);
  end;
end;

function TStringCatHelper.Cat(const V: Boolean): TStringCatHelper;
begin
  Result := Cat(BoolToStr(V));
end;

function TStringCatHelper.Cat(const V: Double): TStringCatHelper;
begin
  Result := Cat(FloatToStr(V));
end;

function TStringCatHelper.Cat(const V: Int64): TStringCatHelper;
begin
  Result := Cat(IntToStr(V));
end;

function TStringCatHelper.Cat(const V: Variant): TStringCatHelper;
begin
  Result := Cat(VarToStr(V));
end;

function TStringCatHelper.Cat(const V: TGuid): TStringCatHelper;
begin
  Result := Cat(GuidToString(V));
end;

function TStringCatHelper.Cat(const V: Currency): TStringCatHelper;
begin
  Result := Cat(CurrToStr(V));
end;

constructor TStringCatHelper.Create(ASize: Integer);
begin
  inherited Create;
  FBlockSize := ASize;
  NeedSize(FBlockSize);
end;

destructor TStringCatHelper.Destroy;
begin
  SetLength(FValue, 0);
  inherited;
end;

constructor TStringCatHelper.Create;
begin
  inherited Create;
  FBlockSize := 4096;
  NeedSize(FBlockSize);
end;

function TStringCatHelper.GetChars(AIndex: Integer): JSONChar;
begin
  Result := FStart[AIndex];
end;

function TStringCatHelper.GetEndChar: PChar;
begin
  Result := FStart + FSize;
end;

function TStringCatHelper.GetPosition: Integer;
begin
  Result := FDest - PJSONChar(FValue);
end;

function TStringCatHelper.GetValue: JSONString;
var
  L: Integer;
begin
  L := FDest - PJSONChar(FValue);
  SetLength(Result, L);
  Move(FStart^, PJSONChar(Result)^, L{$IFDEF JSON_UNICODE} shl 1{$ENDIF});
end;

procedure TStringCatHelper.IncSize(const V: Integer);
begin
  NeedSize(-V);
end;

function TStringCatHelper.GetLast: PJSONChar;
begin
  if FDest > FStart then
    Result := FDest - 1
  else
    Result := nil;
end;

procedure TStringCatHelper.NeedSize(ASize: Integer);
var
  offset:Integer;
begin
  offset := FDest-FStart;
  if ASize < 0 then
    ASize := offset - ASize;
  if ASize > FSize then begin
    FSize := ((ASize + FBlockSize) div FBlockSize) * FBlockSize;
    SetLength(FValue, FSize);
    FStart := PJSONChar(@FValue[0]);
    FDest := FStart + offset;
  end;
end;

function TStringCatHelper.Replicate(const V: string;
  Count: Integer): TStringCatHelper;
var
  ps: PChar;
  l: Integer;
begin
  Result := Self;
  if count > 0 then begin
    ps := PChar(V);
    l := Length(V);
    NeedSize(-(l * Count));
    while count > 0 do begin
      Move(ps^, FDest^, l{$IFDEF UNICODE} shl 1{$ENDIF});
      Inc(FDest, l);
      Dec(count);
    end;
  end;
end;

function TStringCatHelper.Space(count: Integer): TStringCatHelper;
begin
{$IFDEF JSON_UNICODE}
  Result := Self;
  if Count > 0 then begin
    while Count>0 do begin
      Cat(' ');
      Dec(Count);
    end;
  end;
{$ELSE}
  Result := Self;
  if Count > 0 then begin
    while Count>0 do begin
      Cat(' ');
      Dec(Count);
    end;
  end;
{$ENDIF}
end;

procedure TStringCatHelper.SetDest(const Value: PJSONChar);
begin
  if Value < FStart then
    FDest := FStart
  else if (Value - FStart) > FSize then
    FDest := FStart + FSize
  else
    FDest := Value;
end;

procedure TStringCatHelper.SetPosition(const Value: Integer);
begin
  if Value <= 0 then
    FDest := PJSONChar(FValue)
  else if Value>Length(FValue) then begin
    NeedSize(Value);
    FDest := PJSONChar(FValue) + Value;
  end else
    FDest := PJSONChar(FValue) + Value;
end;
{$ENDIF}

{ JSONObject }

procedure JSONObject.put(const key: JSONString; value: Byte);
begin
  Add(Key).Asbyte := value;
end;

procedure JSONObject.put(const key, value: JSONString);
begin
  Add(Key).AsString := value;
end;

procedure JSONObject.put(const key: JSONString; const value: Int64);
begin
  Add(Key).AsInt64 := value;
end;

procedure JSONObject.put(const key: JSONString; value: Integer);
begin
  Add(Key).AsInteger := value;
end;

procedure JSONObject.put(const key: JSONString; value: Word);
begin
  Add(Key).AsWord := value;
end;

procedure JSONObject.put(const key: JSONString; value: Cardinal);
begin
  Add(Key).AsInt64 := value;
end;

procedure JSONObject.Put(const Key: JSONString; Value: array of const);
begin
  AddChildArray(Key, Value);
end;

procedure JSONObject.Put(const Key: JSONString; Value: TStream);
begin
  Add(Key).SetBytes(Value);
end;

procedure JSONObject.put(const key: JSONString; value: JSONObject);
var
  item: PJSONValue;
begin
  item := Add(Key);
  item.AsJsonObject := value;
  if value.FParent <> nil then
    value.FParent.RemoveObject(value)
  else if (value.FValue <> nil) and (value.FValue.FType = jdtUnknown) then
    FreeJsonValue(Value.FValue);
  value.FParent := Self;
  value.FValue := item;
end;

function JSONObject.addChildArray(const key: JSONString): JSONArray;
begin
  if Length(key) > 0 then
    Result := NewChildArray(key)
  else
    Result := nil;
end;

function JSONObject.Add(const Key: JSONString): PJSONValue;
begin
  Result := NewJsonValue();
  Result.FObject := nil;
  Result.FNameHash := 0;
  Result.FName := Key;
  FItems.Add(Result);
end;

function JSONObject.addChildArray(const key: JSONString;
  AItems: array of const): JSONArray;
var
  I: Integer;
begin
  if Length(key) > 0 then begin
    Result := NewChildArray(key);
    for I := Low(AItems) to High(AItems) do begin
      case AItems[I].VType of
        vtInteger:
          Result.add(AItems[I].VInteger);
        vtBoolean:
          Result.Add(AItems[I].VBoolean);
    {$IFNDEF NEXTGEN}
        vtChar:
          Result.Add(JSONString(AItems[I].VChar));
    {$ENDIF !NEXTGEN}
        vtExtended:
          Result.Add(AItems[I].VExtended^);
    {$IFNDEF NEXTGEN}
        vtPChar:
          Result.Add(JSONString(AItems[I].VPChar));
        vtString:
          Result.Add(JSONString(AItems[I].VString^));
        vtAnsiString:
          Result.Add(JSONString(
    {$IFDEF UNICODE}
            PAnsiString(AItems[I].VAnsiString)^
    {$ELSE}
            AItems[I].VPChar
    {$ENDIF UNICODE}
            ));
        vtWideString:
          Result.Add(PWideString(AItems[I].VWideString)^);
    {$ENDIF !NEXTGEN}
        vtPointer:
          Result.Add(IntPtr(AItems[I].VPointer));
        vtWideChar:
          Result.Add(AItems[I].VWideChar);
        vtPWideChar:
          Result.Add(AItems[I].VPWideChar);
        //vtCurrency:
        //  Result.Add(AItems[I].VCurrency^);
        vtInt64:
          Result.Add(AItems[I].VInt64^);
    {$IFDEF UNICODE}       // variants
        vtUnicodeString:
          Result.Add(AItems[I].VPWideChar);
    {$ENDIF UNICODE}
        vtVariant:
          Result.Add(AItems[I].VVariant^);
        vtObject:
          begin
            if TObject(AItems[I].VObject) is JSONObject then
              Result.Add(TObject(AItems[I].VObject) as JSONObject)
            else if TObject(AItems[I].VObject) is JSONArray then
              Result.Add(TObject(AItems[I].VObject) as JSONArray)
            else
              raise Exception.Create(Format(SUnsupportArrayItem, [I]));
          end
      else
        raise Exception.Create(Format(SUnsupportArrayItem, [I]));
      end;
    end;
  end else
    Result := nil;
end;

function JSONObject.addChildObject(const key: JSONString): JSONObject;
begin
  if Length(key) > 0 then
    Result := NewChildObject(key)
  else
    Result := nil;
end;

function JSONObject.Clone: JSONObject;
begin
  Result := NewJsonObject();
  Result.Assign(Self);
end;

function JSONObject.Contains(const Key: JSONString): Boolean;
begin
  Result := Exist(Key);
end;

procedure JSONObject.Delete(const key: JSONString);
begin
  Remove(IndexOf(key));
end;

function JSONObject.getBoolean(const key: JSONString): Boolean;
var
  Item: PJSONValue;
begin
  Item := getItem(key);
  if Item <> nil then
    Result := Item.AsBoolean
  else
    Result := False;
end;

function JSONObject.getByte(const key: JSONString): Byte;
var
  Item: PJSONValue;
begin
  Item := getItem(key);
  if Item <> nil then
    Result := Item.AsByte
  else
    Result := 0;
end;

function JSONObject.GetBytes(const Key: JSONString): TBytes;
var
  Item: PJSONValue;
begin
  Item := getItem(key);
  if Item <> nil then
    Result := Item.AsBytes;
end;

function JSONObject.getDateTime(const key: JSONString): TDateTime;
var
  Item: PJSONValue;
begin
  Item := getItem(key);
  if Item <> nil then
    Result := Item.AsDateTime
  else
    Result := 0;
end;

function JSONObject.getDouble(const key: JSONString): Double;
var
  Item: PJSONValue;
begin
  Item := getItem(key);
  if Item <> nil then
    Result := Item.AsDouble
  else
    Result := 0;
end;

function JSONObject.getDWORD(const key: JSONString): Cardinal;
var
  Item: PJSONValue;
begin
  Item := getItem(key);
  if Item <> nil then
    Result := Item.AsInt64
  else
    Result := 0;
end;

function JSONObject.getFloat(const key: JSONString): Extended;
var
  Item: PJSONValue;
begin
  Item := getItem(key);
  if Item <> nil then
    Result := Item.AsFloat
  else
    Result := 0;
end;

function JSONObject.GetChildForceItem(const Path: JSONString): PJSONValue;
begin
  if Length(Path) = 0 then
    raise Exception.Create(SNameNotFound)
  else
    Result := ForcePath(Path);
end;

function JSONObject.getInt(const key: JSONString): Integer;
var
  Item: PJSONValue;
begin
  Item := getItem(key);
  if Item <> nil then
    Result := Item.AsInteger
  else
    Result := 0;
end;

function JSONObject.getInt64(const key: JSONString): Int64;
var
  Item: PJSONValue;
begin
  Item := getItem(key);
  if Item <> nil then
    Result := Item.AsInt64
  else
    Result := 0;
end;

function JSONObject.getItem(const key: JSONString): PJSONValue;
var
  I: Integer;
begin
  I := IndexOf(Key);
  if I < 0 then
    Result := nil
  else
    Result := FItems[I];
end;

function JSONObject.getJsonArray(const key: JSONString): JSONArray;
var
  Item: PJSONValue;
begin
  Item := getItem(key);
  if Item <> nil then
    Result := Item.AsJsonArray
  else
    Result := nil;
end;

function JSONObject.getJsonObject(const key: JSONString): JSONObject;
var
  Item: PJSONValue;
begin
  Item := getItem(key);
  if Item <> nil then
    Result := Item.AsJsonObject
  else
    Result := nil;
end;

function JSONObject.GetStream(const Key: JSONString): TStream;
var
  Item: PJSONValue;
begin
  Item := getItem(key);
  if Item <> nil then
    Result := Item.AsStream
  else
    Result := nil;
end;

function JSONObject.getString(const key: JSONString): JSONString;
var
  Item: PJSONValue;
begin
  Item := getItem(key);
  if Item <> nil then
    Result := Item.AsString
  else
    Result := '';
end;

function JSONObject.GetChildItem(const Key: JSONString): PJSONValue;
begin
  Result := GetItem(Key);
  if (Result = nil) and (Length(Key) > 0) then 
    Result := Add(Key)
  else if Result = nil then        
    raise Exception.Create(SNameNotFound);
end;

function JSONObject.getVariant(const key: JSONString): Variant;
var
  Item: PJSONValue;
begin
  Item := getItem(key);
  if Item <> nil then 
    Result := Item.AsVariant    
  else
    Result := NULL;
end;

function JSONObject.getWord(const key: JSONString): Word;
var
  Item: PJSONValue;
begin
  Item := getItem(key);
  if Item <> nil then
    Result := Item.AsWord
  else
    Result := 0;
end;

function JSONObject.NextAsJsonObject: JSONObject;
var
  P: PJSONValue;
begin
  P := Next;
  if p <> nil then
    Result := P.AsJsonObject
  else
    Result := nil;
end;

class function JSONBase.ParseValue(ABuilder: TStringCatHelper; var p: PJSONChar): Variant;
var
  ANum: Extended;
begin
  if (p^ = '"') or (p^='''') then begin
    BuildJsonString(ABuilder, p);
    Result := ABuilder.Value;
  end else if ParseNumeric(p, ANum) then begin //���֣�
    if SameValue(ANum, Trunc(ANum)) then
      Result := Trunc(ANum)
    else
      Result := ANum;
  end else if StartWith(p, 'False', True) then begin //False
    Inc(p,5);
    Result := False;
  end else if StartWith(p, 'True', True) then begin //True
    Inc(p,4);
    Result := True;
  end else if StartWith(p, 'NULL', True) then begin //Null
    Inc(p,4);
    Result := varNull;
  end else
    Result := varEmpty;
end;

{$IFDEF USERTTI}
class function JSONObject.ParseObject(const aIn: TObject): JSONObject;
begin
  if not Assigned(aIn) then begin
    Result := nil;
    Exit;
  end;
  Result := NewJsonObject();
  TYxdSerialize.writeValue(Result, '', aIn{$IFNDEF JSON_UNICODE}, TYxdSerialize.GetObjectTypeInfo(aIn){$ENDIF});
end;
{$ENDIF}

class function JSONObject.parseObjectByName(const text, key: JSONString;
  value: Variant): JSONObject;
var
  ABuilder: TStringCatHelper;
  p, p1: PJSONChar;
  c: JSONChar;
  nocmpValue: Boolean;
  i, j: Integer;

  function DecodeCopy(var json: JSONObject; len: Integer): Integer;
  var
    S: JSONString;
  begin
    S := StrDup(p, 0, len);
    p := PJSONChar(S);
    {$IFDEF JSON_UNICODE}SkipSpaceW(p);{$ELSE}SkipSpaceA(p);{$ENDIF}
    Result := json.ParseJsonPair(ABuilder, p)
  end;

  function CmpValue(var p1: PJSONChar): Boolean;
  begin
    try
      if ParseValue(ABuilder, p1) = value then begin
        Result := True;
        if p1^ = '}' then
          Dec(p1);
      end else
        Result := False;
    except
      Result := False;
    end;
  end;

begin
  Result := nil;
  if Length(key) = 0 then Exit;
  p := PJSONChar(text);
  nocmpValue := VarIsEmpty(value) or VarIsNull(value);
  ABuilder := TStringCatHelper.Create;
  try
    while p^ <> #0 do begin
      p1 := StrPos(p, PJSONChar(key));
      if (p1 = nil) then Exit;
      Dec(p1);
      c := p1^;
      if (c = '"') or (c = '''') then begin
        Inc(p1, Length(key) + 1);
        if p1^ <> c then begin
          p := p1 + 2;
          continue;
        end;
        Inc(p1);
        {$IFDEF JSON_UNICODE}SkipSpaceW{$ELSE}SkipSpaceA{$ENDIF}(p1);
        if p1^ <> ':' then Exit;
        Inc(p1);
        {$IFDEF JSON_UNICODE}SkipSpaceW{$ELSE}SkipSpaceA{$ENDIF}(p1);
        if nocmpValue or CmpValue(p1) then begin
          i := p1 - p;
          p := p1;
          j := 0;
          if (not nocmpValue) and (p^ = '}') then begin
            Dec(p);
            Dec(i);
          end;
          while i > -1 do begin
            if (p^ = '{') then begin
              if j = 0 then               
                Break;
              Dec(j);
            end else if (p^ = '}') then
              Inc(j);
            Dec(p);
            Dec(i);
          end;
          if i < 0 then Exit;
          while (p1 <> nil) and (p1^ <> #0) do begin
            if p1^ = '{' then
              Inc(j)
            else if (p1^ = '}') then begin
              if j = 0 then
                Break;
              Dec(j);
            end;
            Inc(p1);
          end;
          if j <> 0 then Exit;
          i := p1 - p + 2;
          ABuilder.Position := 0;
          Result := NewJsonObject();
          if DecodeCopy(Result, i) <> 0 then
            FreeJsonObject(JSONBase(Result));
          Break;
        end else
          ABuilder.Position := 0;
        {$IFDEF JSON_UNICODE}SkipSpaceW{$ELSE}SkipSpaceA{$ENDIF}(p1);
        p := p1;
      end else
        p := p1 + 2;
    end;
  finally
    ABuilder.Free;
  end;
end;

class function JSONObject.parseStringByName(const text,
  key: JSONString): JSONString;
var
  json: JSONObject;
begin
  json := parseObjectByName(text, key, NULL);
  if Assigned(json) then begin
    Result := json.getString(key);
    FreeJsonObject(JSONBase(json));
  end else
    Result := '';
end;

procedure JSONObject.put(const key: JSONString; value: JSONArray);
var
  item: PJSONValue;
begin
  item := Add(Key);
  item.AsJsonArray := value;
  if value.FParent <> nil then
    value.FParent.RemoveObject(value)
  else if (value.FValue <> nil) and (value.FValue.FType = jdtUnknown) then
    FreeJsonValue(Value.FValue);
  value.FParent := Self;
  value.FValue := item;
end;

procedure JSONObject.Put(const Key: JSONString; Value: Boolean);
begin
  Add(Key).AsBoolean := value;
end;

procedure JSONObject.put(const key: JSONString; ABuilder: TStringCatHelper);
var
  item: PJSONValue;
  L: Integer;
begin
  item := Add(Key);
  item.FType := jdtString;
  L := ABuilder.Position{$IFDEF JSON_UNICODE} shl 1{$ENDIF};
  SetLength(item.FValue, L);
  if (L > 0) then
    Move(ABuilder.Start^, Item.FValue[0], L);
end;

procedure JSONObject.put(const key: JSONString; const value: Variant);
var
  Item: PJSONValue;
begin
  Item := Add(Key);
  Item.AsVariant := value;
  if Assigned(Item.FObject) then
    Item.FObject.FParent := Self;
end;

procedure JSONObject.put(const key: JSONString; const value: Extended);
begin
  Add(Key).AsFloat := value;
end;

procedure JSONObject.put(const key: JSONString; const value: Double);
begin
  Add(Key).AsDouble := value;
end;

procedure JSONObject.Put(const Key: JSONString; const Value: TBytes);
begin
  Add(Key).AsBytes := Value;
end;

procedure JSONObject.putDateTime(const key: JSONString; value: TDateTime);
begin
  Add(Key).AsDateTime := value;
end;

procedure JSONObject.SetBoolean(const Key: JSONString; const Value: Boolean);
begin
  if Length(Key) > 0 then
    GetChildItem(Key).AsBoolean := Value;
end;

procedure JSONObject.SetByte(const Key: JSONString; Value: Byte);
begin
  if Length(Key) > 0 then   
    GetChildItem(Key).AsByte := Value;
end;

procedure JSONObject.SetBytes(const Key: JSONString; const Value: TBytes);
begin
  if Length(Key) > 0 then
    GetChildItem(Key).AsBytes := Value;
end;

procedure JSONObject.SetDateTime(const Key: JSONString; const Value: TDateTime);
begin
  if Length(Key) > 0 then   
    GetChildItem(Key).AsDateTime := Value;
end;

procedure JSONObject.SetDouble(const Key: JSONString; const Value: Double);
begin
  if Length(Key) > 0 then   
    GetChildItem(Key).AsDouble := Value;
end;

procedure JSONObject.SetDWORD(const Key: JSONString; const Value: Cardinal);
begin
  if Length(Key) > 0 then   
    GetChildItem(Key).AsInteger := Value;
end;

procedure JSONObject.SetInt(const Key: JSONString; const Value: Integer);
begin
  if Length(Key) > 0 then   
    GetChildItem(Key).AsInteger := Value;
end;

procedure JSONObject.SetInt64(const Key: JSONString; const Value: Int64);
begin
  if Length(Key) > 0 then   
    GetChildItem(Key).AsInt64 := Value;
end;

procedure JSONObject.SetJsonArray(const Key: JSONString; const Value: JSONArray);
begin
  if Length(Key) > 0 then   
    GetChildItem(Key).AsJsonArray := Value;
end;

procedure JSONObject.SetJsonObject(const Key: JSONString;
  const Value: JSONObject);
begin
  if Length(Key) > 0 then   
    GetChildItem(Key).AsJsonObject := Value;
end;

procedure JSONObject.SetStream(const Key: JSONString; const Value: TStream);
begin
  if Length(Key) > 0 then
    GetChildItem(Key).AsStream := Value;
end;

procedure JSONObject.SetString(const Key, Value: JSONString);
begin
  if Length(Key) > 0 then   
    GetChildItem(Key).AsString := Value;
end;

procedure JSONObject.SetVariant(const Key: JSONString; const Value: Variant);
begin
  if Length(Key) > 0 then   
    GetChildItem(Key).AsVariant := Value;
end;

procedure JSONObject.SetWord(const Key: JSONString; const Value: Word);
begin
  if Length(Key) > 0 then   
    GetChildItem(Key).AsWord := Value;
end;

{ JSONArray }

procedure JSONArray.add(value: JSONObject);
var
  item: PJSONValue;
begin
  item := NewJsonValue();
  item.AsJsonObject := value;
  if value.FParent <> nil then
    value.FParent.RemoveObject(value)
  else if (value.FValue <> nil) and (value.FValue.FType = jdtUnknown) then
    FreeJsonValue(Value.FValue);
  value.FParent := Self;
  value.FValue := item;
end;

procedure JSONArray.add(value: Byte);
begin
  NewJsonValue().Asbyte := value;
end;

procedure JSONArray.add(const value: JSONString);
begin
  NewJsonValue().AsString := value;
end;

procedure JSONArray.add(value: Cardinal);
begin
  NewJsonValue().AsInt64 := value;
end;

procedure JSONArray.add(value: Integer);
begin
  NewJsonValue().AsInteger := value;
end;

procedure JSONArray.add(value: Word);
begin
  NewJsonValue().AsWord := value;
end;

procedure JSONArray.add(const value: Int64);
begin
  NewJsonValue().AsInt64 := value;
end;

procedure JSONArray.add(const value: Variant);
var
  Item: PJSONValue;
begin
  Item := NewJsonValue();
  Item.AsVariant := value;
  if Assigned(Item.FObject) then
    Item.FObject.FParent := Self;
end;

procedure JSONArray.add(value: JSONArray);
var
  item: PJSONValue;
begin
  item := NewJsonValue();
  item.AsJsonArray := value;
  if value.FParent <> nil then
    value.FParent.RemoveObject(value)
  else if (value.FValue <> nil) and (value.FValue.FType = jdtUnknown) then
    FreeJsonValue(Value.FValue);
  value.FParent := Self;
  value.FValue := item;
end;

procedure JSONArray.Add(Value: TStream);
begin
  NewJsonValue().SetBytes(Value);
end;

procedure JSONArray.Add(const Value: TBytes);
begin
  NewJsonValue().AsBytes := Value;
end;

procedure JSONArray.Add(const Value: array of const);
begin
  JSONObject(Self).AddChildArray('', Value);
end;

procedure JSONArray.Add(Value: Boolean);
begin
  NewJsonValue().AsBoolean := value;
end;

function JSONArray.addChildArray: JSONArray;
begin
  Result := NewChildArray('');
end;

function JSONArray.addChildObject: JSONObject;
begin
  Result := NewChildObject('');
end;

function JSONArray.AddChildArray(const Index: Integer): JSONArray;
var
  Item: PJSONValue;
begin
  Result := NewJsonArray();
  Result.FParent := Self;
  Item := YxdJson.NewJsonValue();
  Item.FName := '';
  Item.FNameHash := 0;
  Item.FObject := Result;
  Item.FType := jdtObject;
  if (Index < 0) or (Index >= FItems.Count) then   
    FItems.Add(Item)
  else
    FItems.Insert(Index, Item);
  Result.FValue := Item;
end;

function JSONArray.AddChildObject(const Index: Integer): JSONObject;
var
  Item: PJSONValue;
begin
  Result := NewJsonObject();
  Result.FParent := Self;
  Item := YxdJson.NewJsonValue();
  Item.FName := '';
  Item.FNameHash := 0;
  Item.FObject := Result;
  Item.FType := jdtObject;
  if (Index < 0) or (Index >= FItems.Count) then   
    FItems.Add(Item)
  else
    FItems.Insert(Index, Item);
  Result.FValue := Item;
end;

procedure JSONArray.add(const value: Extended);
begin
  NewJsonValue().AsFloat := value;
end;

procedure JSONArray.add(const value: Double);
begin
  NewJsonValue().AsDouble := value;
end;

procedure JSONArray.addDateTime(value: TDateTime);
begin
  NewJsonValue().AsDateTime := value;
end;

procedure JSONArray.addJSON(const value: JSONString; AType: JsonDataType);
begin
  putJSON('', value, AType);
end;

procedure JSONArray.AddNull;
begin
  NewJsonValue().FType := jdtNull;
end;

function JSONArray.Clone: JSONArray;
begin
  Result := NewJsonArray();
  Result.Assign(Self);
end;

function JSONArray.getBoolean(Index: Integer): Boolean;
var
  Item: PJSONValue;
begin
  Item := FItems[index];
  if Item <> nil then
    Result := Item.AsBoolean
  else
    Result := False;
end;

function JSONArray.getByte(Index: Integer): Byte;
var
  Item: PJSONValue;
begin
  Item := FItems[index];
  if Item <> nil then
    Result := Item.AsByte
  else
    Result := 0;
end;

function JSONArray.GetBytes(Index: Integer): TBytes;
var
  Item: PJSONValue;
begin
  Item := FItems[index];
  if Item <> nil then
    Result := Item.AsBytes
end;

function JSONArray.getDateTime(Index: Integer): TDateTime;
var
  Item: PJSONValue;
begin
  Item := FItems[index];
  if (Item <> nil) and (Item.FType <> jdtNull) and (Length(Item.FValue) > 0) then
    Result := Item.AsDateTime
  else
    Result := 0;
end;

function JSONArray.getDouble(Index: Integer): Double;
var
  Item: PJSONValue;
begin
  Item := FItems[index];
  if Item <> nil then
    Result := Item.AsDouble
  else
    Result := 0;
end;

function JSONArray.getDWORD(Index: Integer): Cardinal;
var
  Item: PJSONValue;
begin
  Item := FItems[index];
  if Item <> nil then
    Result := Item.AsInt64
  else
    Result := 0;
end;

function JSONArray.getFloat(Index: Integer): Extended;
var
  Item: PJSONValue;
begin
  Item := FItems[index];
  if Item <> nil then
    Result := Item.AsFloat
  else
    Result := 0;
end;

function JSONArray.getInt(Index: Integer): Integer;
var
  Item: PJSONValue;
begin
  Item := FItems[index];
  if Item <> nil then
    Result := Item.AsInteger
  else
    Result := 0;
end;

function JSONArray.getInt64(Index: Integer): Int64;
var
  Item: PJSONValue;
begin
  Item := FItems[index];
  if Item <> nil then
    Result := Item.AsInt64
  else
    Result := 0;
end;

function JSONArray.GetIsArray: Boolean;
begin
  Result := True;
end;

function JSONArray.getJsonArray(Index: Integer): JSONArray;
var
  item: PJSONValue;
begin
  Item := FItems[index];
  if Item <> nil then
    Result := Item.AsJsonArray
  else
    Result := nil;
end;

function JSONArray.getJsonObject(Index: Integer): JSONObject;
var
  item: PJSONValue;
begin
  Item := FItems[index];
  if Item <> nil then
    Result := Item.AsJsonObject
  else
    Result := nil;
end;

function JSONArray.GetStream(Index: Integer): TStream;
var
  Item: PJSONValue;
begin
  Item := FItems[index];
  if Item <> nil then
    Result := Item.AsStream
  else
    Result := nil;
end;

function JSONArray.getString(Index: Integer): JSONString;
var
  Item: PJSONValue;
begin
  Item := FItems[index];
  if Item <> nil then
    Result := Item.AsString
  else
    Result := '';
end;

function JSONArray.getVariant(Index: Integer): Variant;
var
  Item: PJSONValue;
begin
  Item := FItems[index];
  if Item <> nil then
    Result := Item.AsVariant
  else
    Result := varEmpty;
end;

function JSONArray.getWord(Index: Integer): Word;
var
  Item: PJSONValue;
begin
  Item := FItems[index];
  if Item <> nil then
    Result := Item.AsWord
  else
    Result := 0;
end;

function JSONArray.NewJsonValue(): PJSONValue;
begin
  Result := YxdJson.NewJsonValue();
  Result.FObject := nil;
  Result.FName := '';
  Result.FNameHash := 0;
  FItems.Add(Result);
end;

function JSONArray.NextAsJsonArray: JSONArray;
var
  P: PJSONValue;
begin
  P := Next;
  if p <> nil then
    Result := P.AsJsonArray
  else
    Result := nil;
end;

{$IFDEF JSON_RTTI}
procedure JSONArray.PutObject(ASource: TObject);
begin
  TYxdSerialize.writeValue(Self, '', aSource);
end;
{$ENDIF}

{$IFDEF JSON_RTTI}
procedure JSONArray.PutRecord<T>(const ASource: T);
begin
  TYxdSerialize.writeValue(Self, '', @aSource, TypeInfo(T));
end;
{$ENDIF}

procedure JSONArray.SetBoolean(Index: Integer; const Value: Boolean);
begin
  if (Index < 0) or (Index >= Count) then
    Add(Value)
  else 
    FItems[index].AsBoolean := Value;
end;

procedure JSONArray.SetByte(Index: Integer; const Value: Byte);
begin
  if (Index < 0) or (Index >= Count) then
    Add(Value)
  else 
    FItems[index].AsByte := Value;
end;

procedure JSONArray.SetBytes(Index: Integer; const Value: TBytes);
begin
  if (Index < 0) or (Index >= Count) then
    Add(Value)
  else
    FItems[index].AsBytes := Value;
end;

procedure JSONArray.SetDateTime(Index: Integer; const Value: TDateTime);
begin
  if (Index < 0) or (Index >= Count) then
    Add(Value)
  else 
    FItems[index].AsDateTime := Value;
end;

procedure JSONArray.SetDouble(Index: Integer; const Value: Double);
begin
  if (Index < 0) or (Index >= Count) then
    Add(Value)
  else 
    FItems[index].AsDouble := Value;
end;

procedure JSONArray.SetDWORD(Index: Integer; const Value: Cardinal);
begin
  if (Index < 0) or (Index >= Count) then
    Add(Value)
  else 
    FItems[index].AsInteger := Value;
end;

procedure JSONArray.SetInt(Index: Integer; const Value: Integer);
begin
  if (Index < 0) or (Index >= Count) then
    Add(Value)
  else 
    FItems[index].AsInteger := Value;
end;

procedure JSONArray.SetInt64(Index: Integer; const Value: Int64);
begin
  if (Index < 0) or (Index >= Count) then
    Add(Value)
  else 
    FItems[index].AsInt64 := Value;
end;

procedure JSONArray.SetJsonArray(Index: Integer; const Value: JSONArray);
begin
  if (Index < 0) or (Index >= Count) then
    Add(Value)
  else 
    FItems[index].AsJsonArray := Value;
end;

procedure JSONArray.SetJsonObject(Index: Integer; const Value: JSONObject);
begin
  if (Index < 0) or (Index >= Count) then
    Add(Value)
  else 
    FItems[index].AsJsonObject := Value;
end;

procedure JSONArray.SetStream(Index: Integer; Value: TStream);
begin
  if (Index < 0) or (Index >= Count) then
    Add(Value)
  else
    FItems[index].AsStream := Value;
end;

procedure JSONArray.SetString(Index: Integer; const Value: JSONString);
begin
  if (Index < 0) or (Index >= Count) then
    Add(Value)
  else 
    FItems[index].AsString := Value;
end;

procedure JSONArray.SetVariant(Index: Integer; const Value: Variant);
begin
  if (Index < 0) or (Index >= Count) then
    Add(Value)
  else 
    FItems[index].AsVariant := Value;
end;

procedure JSONArray.SetWord(Index: Integer; const Value: Word);
begin
  if (Index < 0) or (Index >= Count) then
    Add(Value)
  else
    FItems[index].AsWord := Value;
end;

function InitJsonFloatPrecisionFmt(i: Integer): JSONString;
begin
  SetLength(Result, I);
  for i := 1 to Length(Result) do
    Result[i] := '0';
end;

{ JSONList }

{$IFNDEF UNICODE}
function JSONList.Get(Index: Integer): PJSONValue;
begin
  Result := inherited Get(Index);
end;

procedure JSONList.Put(Index: Integer; Item: PJSONValue);
begin
  inherited Put(Index, Item);
end;
{$ENDIF}

{ TJsonSerializeWriter }

{$IFDEF USERTTI}
procedure TJsonSerializeWriter.AddInt64(const Value: Int64);
begin
  FData.Cat(IntToStr(Value)).Cat(',');
end;

procedure TJsonSerializeWriter.Add(const Value: Integer);
begin
  FData.Cat(IntToStr(Value)).Cat(',');
end;

procedure TJsonSerializeWriter.Add(const Value: string);
begin
  FData.Cat('"');
  CatValue(FData, Value, FDoEscape);
  FData.Cat('",');
end;

procedure TJsonSerializeWriter.Add(const Value: Cardinal);
begin
  FData.Cat(IntToStr(Value)).Cat(',');
end;

procedure TJsonSerializeWriter.Add(const Value: Variant);

  procedure SetVariantArray();
  var
    I: Integer;
  begin
    BeginData('', True);
    for I := VarArrayLowBound(Value, VarArrayDimCount(Value))
      to VarArrayHighBound(Value, VarArrayDimCount(Value)) do
      Add(Value[I]);
    EndData;
  end;

begin
  case FindVarData(Value)^.VType of
    varBoolean: Add(Boolean(Value));
    varByte, varWord, varSmallint, varInteger, varShortInt:
      Add(Integer(Value));
    varLongWord:
      Add(Cardinal(Value));
    varInt64:
      AddInt64(Integer(Value));
    varSingle, varDouble, varCurrency:
      Add(Double(Value));
    varDate:
      Add(VarToDateTime(Value));
    varOleStr, varString:
      Add(string(Value));
    else begin
      if VarIsArray(Value) then begin
        SetVariantArray();
      end else begin
        Add('');
      end;
    end;
  end;
end;

procedure TJsonSerializeWriter.Add(const Value: Boolean);
begin
  FData.Cat(BoolToStr(Value)).Cat(',');
end;

procedure TJsonSerializeWriter.Add(const Value: Double);
begin
  FData.Cat(FloatToStr(Value)).Cat(',');
end;

procedure TJsonSerializeWriter.AddTime(const Value: TDateTime);
begin
  if StrictJson then
    StrictJsonTime(FData, Value)
  else
    FData.Cat('"').Cat(ValueAsDateTime(JsonDateFormat, JsonTimeFormat, JsonDateTimeFormat, Value)).Cat('"');
  FData.Cat(',');
end;

procedure TJsonSerializeWriter.BeginData(const Name: string; const IsArray: Boolean);
begin
  Push(FIsArray);
  FIsArray := IsArray;
  if Name <> '' then
    FData.Cat('"').Cat(Name).Cat('":');
  if IsArray then
    FData.Cat('[')
  else
    FData.Cat('{');
end;

procedure TJsonSerializeWriter.BeginRoot;
begin
end;

constructor TJsonSerializeWriter.Create;
begin
  FData := TStringCatHelper.Create;
  FDoEscape := True;
end;

destructor TJsonSerializeWriter.Destroy;
begin
  FreeAndNil(FData);
  inherited;
end;

procedure TJsonSerializeWriter.EndData;
begin
  if (FData.Last = ',') then
    FData.Back(1);
  if FIsArray then
    FData.Cat('],')
  else
    FData.Cat('},');
  FIsArray := Pop;
end;

procedure TJsonSerializeWriter.EndRoot;
begin
  if (FData.Position = 0) then begin
    if FIsArray then
      FData.Cat('[]')
    else
      FData.Cat('{}');
  end;
end;

function TJsonSerializeWriter.IsArray: Boolean;
begin
  Result := FIsArray;
end;

function TJsonSerializeWriter.ToString: string;
begin
  if (FData.Last = ',') then
    FData.Back(1);
  Result := FData.Value;
end;

procedure TJsonSerializeWriter.WriteBoolean(const Name: string;
  const Value: Boolean);
begin
  WriteName(Name);
  if Value then
    FData.Cat('true')
  else
    FData.Cat('false');
  FData.Cat(',');
end;

procedure TJsonSerializeWriter.WriteDateTime(const Name: string; const Value: TDateTime);
begin
  WriteName(Name);
  AddTime(Value);
end;

procedure TJsonSerializeWriter.WriteFloat(const Name: string;
  const Value: Double);
begin
  WriteName(Name);
  FData.Cat(FloatToStr(Value)).Cat(',');
end;

procedure TJsonSerializeWriter.WriteInt(const Name: string;
  const Value: Integer);
begin
  WriteName(Name);
  FData.Cat(IntToStr(Value)).Cat(',');
end;

procedure TJsonSerializeWriter.WriteInt64(const Name: string;
  const Value: Int64);
begin
  WriteName(Name);
  FData.Cat(IntToStr(Value)).Cat(',');
end;

procedure TJsonSerializeWriter.WriteName(const Name: string);
begin
  if FIsArray then Exit;
  FData.Cat('"').Cat(Name).Cat('":');
end;

procedure TJsonSerializeWriter.WriteNull(const Name: string);
begin
  WriteName(Name);
  FData.Cat(CharNull);
end;

procedure TJsonSerializeWriter.WriteString(const Name, Value: string);
begin
  WriteName(Name);
  Add(Value);
end;

procedure TJsonSerializeWriter.WriteUInt(const Name: string;
  const Value: Cardinal);
begin
  WriteName(Name);
  FData.Cat(IntToStr(Value)).Cat(',');
end;

procedure TJsonSerializeWriter.WriteVariant(const Name: string;
  const Value: Variant);

  procedure SetVariantArray();
  var
    I: Integer;
  begin
    BeginData(Name, True);
    for I := VarArrayLowBound(Value, VarArrayDimCount(Value))
      to VarArrayHighBound(Value, VarArrayDimCount(Value)) do
      Add(Value[I]);
    EndData;
  end;

begin
  case FindVarData(Value)^.VType of
    varBoolean: WriteBoolean(Name, Value);
    varByte, varWord, varSmallint, varInteger, varShortInt:
      WriteInt(Name, Value);
    varLongWord:
      WriteUInt(Name, Value);
    varInt64:
      WriteInt64(Name, Value);
    varSingle, varDouble, varCurrency:
      WriteFloat(Name, Value);
    varDate:
      WriteDateTime(Name, Value);
    varOleStr, varString:
      WriteString(Name, Value);
    else begin
      if VarIsArray(Value) then begin
        SetVariantArray();
      end else begin
        WriteString(Name, '');
      end;
    end;
  end;
end;
{$ENDIF}

initialization
{$IFNDEF USERTTI}
  CSPBlobs := PJSONChar(CSBlobs);
  CSPBlobs2 := CSPBlobs + 4;
  CSPBlobs3 := CSPBlobs2 + 2;
{$ENDIF}
{$IFDEF USEPool}
  Pool_JsonValue := TSyncMemPool.Create(Max(SizeOf(JSONValue), 32), 40960);
  Pool_JsonObject := TSyncObjectPool.Create(SizeOf(JSONObject), 40960);
  Pool_JsonObject.FClass := JSONObject;
  Pool_JsonArray := TSyncObjectPool.Create(SizeOf(JSONArray), 40960);
  Pool_JsonArray.FClass := JSONArray;
{$ENDIF}

finalization
{$IFDEF USEPool}
  FreeAndNil(Pool_JsonValue);
  FreeAndNil(Pool_JsonObject);
  FreeAndNil(Pool_JsonArray);
{$ENDIF}

end.