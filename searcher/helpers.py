def get_date_to(key_date):
    """возвращает дату в формате dd.mm.YYYY из даты YYYY-mm-dd"""
    parts = key_date.split('-')
    return '{}.{}.{}'.format(parts[2], parts[1], parts[0])
