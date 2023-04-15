import {
  Body,
  Controller,
  Delete,
  Get,
  HttpCode,
  HttpStatus,
  Param,
  ParseIntPipe,
  Patch,
  Post,
} from '@nestjs/common';
import { BookmarkService } from './bookmark.service';
import { CreateBookmarkDto, EditBookmarkDto } from './dto';

@Controller('bookmarks')
export class BookmarkController {
  constructor(private bookmarkService: BookmarkService) {}
  @Get()
  getBookmarks() {
    return this.bookmarkService.getBookmarks();
  }

  @Get(':id')
  getSingleBookmark(@Param('id', ParseIntPipe) bookmarkId: number) {
    return this.bookmarkService.getSingleBookmark(bookmarkId);
  }

  @Post()
  createBookmarksById(@Body() dto: CreateBookmarkDto) {
    return this.bookmarkService.createBookmark(dto);
  }

  @Patch(':id')
  editBookmark(
    @Param('id', ParseIntPipe) bookmarkId: number,
    @Body() dto: EditBookmarkDto,
  ) {
    return this.bookmarkService.editBookmark(bookmarkId, dto);
  }

  @Delete(':id')
  deleteBookmarksById(@Param('id', ParseIntPipe) bookmarkId: number) {
    return this.bookmarkService.deleteBookmark(bookmarkId);
  }
}
