unit Patient.Interfaces;

interface
uses
  System.Classes,
  Patient.Domain,
  Persistence.Interfaces;

type

  IPatientListController = interface
//    ['{2FF350CC-4209-407F-B587-09E73D4CCEA8}']
    {$REGION 'Getters and Setters'}
    function GetOnListChanged: TNotifyEvent;
    procedure SetOnListChanged(const AEvent: TNotifyEvent);
    function GetPatientList: TPatientListItemList;
    function GetContext: IContext;
    {$ENDREGION}

    procedure Load;

    property PatientList: TPatientListItemList read GetPatientList;
    property Context: IContext read GetContext;

    property OnListChanged: TNotifyEvent read GetOnListChanged write SetOnListChanged;
  end;

  IEditItemController = interface
//    ['{54917E1B-86A3-4B64-A79A-D3DC40DBE418}']
    {$REGION 'Getters and Setters'}
    function GetItem: TPatientItem;

//    function GetStockLevel: integer;
//    procedure SetStockLevel(const ALevel: integer);
    function GetIsNewItem: boolean;
    {$ENDREGION}

    procedure NewItem;
    procedure LoadItem(const APatientItemID: integer);
    procedure SaveItem;

    property IsNewItem: boolean read GetIsNewItem;
//    property StockLevel: integer read GetStockLevel write SetStockLevel;
    property Item: TPatientItem read GetItem;
  end;

  IPatientStartupController = interface
//    ['{D684D214-7CC9-4AD6-988E-8B6523DC9821}']
    {$REGION 'Getters and Setters'}
    function GetDataLocation: string;
    {$ENDREGION}

    function CreateContext: IContext;

    property DataLocation: string read GetDataLocation;
  end;


implementation

end.
