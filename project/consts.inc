
const
  WM_WARECHANGED = WM_USER + 1;
  WM_SESSION_ADDED = WM_USER + 2;
  WM_SESSION_DELETED = WM_USER + 3;
  WM_COUNTERS_CHANGED = WM_USER + 4;
  WM_RECRESTORED = WM_USER + 5;
  WM_LOGADDED = WM_USER + 6;
  WM_SESSION_CLOSED = WM_USER + 7;

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

    