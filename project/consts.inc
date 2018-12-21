
const
  WM_WARECHANGED = WM_USER + 1;
  WM_SESSION_ADDED = WM_USER + 2;
  WM_SESSION_DELETED = WM_USER + 3;
  WM_COUNTERS_CHANGED = WM_USER + 4;
  WM_RECRESTORED = WM_USER + 5;
  WM_LOGADDED = WM_USER + 6;
  WM_SESSION_CLOSED = WM_USER + 7;
  WM_SESSION_UPDATED = WM_USER + 8;
  WM_STATION_CHANGED = WM_USER + 9;
  WM_CONN_REOPEN = WM_USER + 10;
  WM_STATE_CHANGED = WM_USER + 11;
  WM_STATE_CHANGED_FEXT = WM_USER + 12;
  WM_CATS_UPD = WM_USER + 13;
  WM_GSM_CHANGED = WM_USER + 14;


  // session states

const
  S_NEW = 0;
  S_CHANGED = 1;
  S_VERIFIED = 2;
  S_CLOSED = 3;
  S_PARTLY = 4;
  S_SENT = 5;

  SS_NEW = '0';
  SS_CHANGED = '1';
  SS_VERIFIED = '2';
  SS_CLOSED = '3';
  SS_PARTLY = '4';
  SS_SENT = '5';

type Rec =
    record
      id, session_id: Integer;
      prev_id, prev_session_id: Integer;
      scnt, ecnt, prev_scnt, prev_ecnt: Extended;
      outcome: Extended;
    end;


type
     TRecArray = Array of Rec;
     PRecArray = ^TrecArray;

type Qparam =
    record
      Name: String;
      DataType: Data.DB.TFieldType;
      ParamType: Data.DB.TParamType;
    end;

type
  TQParamArray = Array of QParam;
  PQparamArray = ^TQparamArray;



  type PMode =
    record
      code: string;
      RNT,
      RBT   ,
      RNM   ,
      RBM   ,
      CAOT  ,
      CAOM:  Boolean;
    end;

type PMSums =
  record
    rnt_volume, rbt_volume, rnm_amount, rbm_amount, caot_volume, caom_amount: Extended;
    rnt_amount0, rbt_amount0, rnm_summ, rbm_summ, caot_amount0, caom_summ: Extended;
    rnt_sumnds, rbt_sumnds, rnm_sumnds, rbm_sumnds, caot_sumnds, caom_sumnds: Extended;
    rnt_whole, rbt_whole, rnm_whole, rbm_whole, caot_whole, caom_whole: Extended;
    dirty: Boolean;
  end;
