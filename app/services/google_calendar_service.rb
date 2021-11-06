class GoogleCalendarSerivice
  class << self
    def calendar_body(data)
      {
        kind: 'calendar#event',
        created: datetime,
        location: string,
        creator: {
          id: data[:user_id],
          email: data[:user_email],
          self: true
        },
        start: {
          date: data[:date],
          dateTime: datetime,
          timeZone: datetime
        },
        end: {
          date: data[:date],
          dateTime: datetime,
          timeZone: string
        },
        attendees: [
          {
            id: data[:invited_id],
            email: data[:invited_email]
          }
        ]
      }
    end
  end
end
