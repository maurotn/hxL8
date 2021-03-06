package hxl8.responses;

import haxe.io.Bytes;

class L8ResponseNotificationSilence extends L8ResponseBase
{
    private var m_code : Bool;

    public function new ()
    {
        super ();
        m_code = false;
    }
    override public function parseData (data : Bytes) : Void
    {
        super.parseData (data);
        if (data.length == 2)
        {
            m_code = (data.get (1) == 1);
        }
    }
    override public function toString () : String
    {
        if (m_code)
        {
            return "NotificationSilence: on";
        }
        return "NotificationSilence: off";
    }
    override public function toCSV (header : Bool = false) : Array<String>
    {
        var result : Array<String> = super.toCSV (header);
        if (header)
        {
            result.push ("response;notification silence");
        }
        result.push ('$m_cmd;$m_code');
        return result;
    }
}
